class User < ActiveRecord::Base
  TEMP_EMAIL_REGEX = /\Achange@me/
  TEMP_EMAIL_PREFIX = 'change@me'
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

	has_and_belongs_to_many :chats
  def self.find_for_oauth(auth, signed_in_resource = nil)
		# Get the identity and user if they exist:
		identity = Identity.find_for_oauth(auth)

		# If a signed_in_resource is provided it always overrides the existing user
		# to prevent the identity being locked with accidentally created accounts.
		# Note that this may leave zombie accounts (with no associated identity)
		# which can be cleaned up at a later date.
		user = signed_in_resource ? signed_in_resource : identity.user

		# Create the user if needed:
		if user.nil?
			# Get the existing user by email if the provider gives us a verified
			# email. If no verified email was provided we assign a temporary email
			# and ask the user to verify it on the next step via
			# UsersController.finish_signup.
			name = auth.info.name
			email = auth.info.email
			user = User.where(:email => email).first if email

			# Create the user if it's a new registration:
			if user.nil?
				user = User.new(
					:name => name,
					:email => email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
					:password => Devise.friendly_token[0, 20]
				)
				user.skip_confirmation! if user.respond_to?(:skip_confirmation)
				user.save!
			end
		end

		# Associate the identity with the user if needed:
		if identity.user != user
			identity.user = user
			identity.save!
		end
		user
	end
end

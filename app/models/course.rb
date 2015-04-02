class Course < ActiveRecord::Base
	has_and_belongs_to_many :locations
	has_many :chats, :dependent => :destroy

	def self.search(search)
		if search
			Course.where('name LIKE ?', "%#{search}%")
		else
			all
		end
	end
end

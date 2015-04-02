class Location < ActiveRecord::Base
	has_and_belongs_to_many :courses
	has_many :chats, :dependent => :destroy

	def self.search(search)
		if search
			Location.where('name LIKE ?', "%#{search}%")
		else
			all
		end
	end
end

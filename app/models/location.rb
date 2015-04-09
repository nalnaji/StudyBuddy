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
	def number_of_students
		total = 0
		self.chats.each do |chat|
			total += chat.users.count
		end
		total
	end
	def number_of_students_in_course(course_id)
		chat = Chat.find_by_course_id_and_location_id(course_id, self.id)
		if chat != nil then
			return chat.number_of_participants
		end
		0		
	end
end

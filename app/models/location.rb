class Location < ActiveRecord::Base
  has_and_belongs_to_many :courses
  has_many :chats, :dependent => :destroy

  def self.search(search, course)
    if search
      Location.where('lower(name) LIKE ?', "%#{search.downcase}%").sort_by do |location|
        location.number_of_students_in_course(course)
      end.reverse
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
  def as_json(options = {})
    json = super(:except => [:created_at, :updated_at])
    json['number_of_students'] = number_of_students_in_course(options[:course_id])
    json
  end
end

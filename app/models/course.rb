class Course < ActiveRecord::Base
  has_and_belongs_to_many :locations
  has_many :chats, :dependent => :destroy

  def self.search(search)
    if search
      Course.where('lower(name) LIKE ?', "%#{search.downcase}%").sort_by(&:number_of_students).reverse
    else
      all
    end
  end

  def number_of_students
    total = 0
    self.chats.each do |chat|
      total += chat.number_of_participants
    end
    total
  end

  def as_json(options={})
    super(:only => [:id, :name],
          :methods => [:number_of_students] 
         )
  end
end

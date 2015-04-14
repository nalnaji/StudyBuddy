class Chat < ActiveRecord::Base
  belongs_to :course
  belongs_to :location
	has_many :messages, :dependent => :destroy
	has_and_belongs_to_many :users, -> {distinct(:id)} 
	
	def number_of_participants
		self.users.count
	end
end
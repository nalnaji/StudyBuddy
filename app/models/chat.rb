class Chat < ActiveRecord::Base
  belongs_to :course
  belongs_to :location
	has_many :messages, :dependent => :destroy
end

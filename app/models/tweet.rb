class Tweet < ActiveRecord::Base
	belongs_to :user
	validates :description, 
            :uniqueness => true
end

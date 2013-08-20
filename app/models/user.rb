class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :token_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  validates :name, 
            :presence => true
  validates :name, 
            :uniqueness => true
  #Friendly url feature configuration          
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  #Follow feature configuration
  acts_as_follower
  acts_as_followable

  has_many :tweets
  #has_many :retweets
end

class Adventure < ActiveRecord::Base
  attr_accessible :city, :state, :name, :date, :user_id
  validates_presence_of :name, :state

  belongs_to :user
  has_many :attendees 
  has_many :invitations
  has_many :possible_dates
  before_create :generate_token 
  after_create :add_host

  def self.find_from_token(token)
    Adventure.where(token: token).first
  end 

  def generate_token 
    self.token = Digest::SHA1.hexdigest(self.name + self.description + rand(5000).to_s)
  end 

  def add_host 
    host_adventure(user_id)
  end 

  def host_adventure(new_user_id)
    contacts.create(user_id: new_user_id)
  end 

  def host? 
    user.id == user.id
  end

  # move two methods below to calendars service? 
  def best_date
    #possible dates- sort by > number of my contacts available == best_time
  end 


  def available_contacts
    # iterate through contacts 
      # check each contacts calendar for dates
    # end 
  end 
  
end

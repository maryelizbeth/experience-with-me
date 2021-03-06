class User < ActiveRecord::Base
  devise :omniauthable, :database_authenticatable

  attr_accessible :email, :name, :password, :password_confirmation
  has_many :authentications
  has_many :possible_attendees
  has_many :invitations

  def self.find_for_google(data, signed_in_resource=nil)
    user = User.where(email: data["info"]["email"].downcase).first_or_create(google_hash(data["info"]))
    user.authentications.find_or_create_for_google_yippee(data)
    user
  end

  def self.google_hash(data)
  {
    name: data["name"],
    email: data["email"]
  }
  end

end

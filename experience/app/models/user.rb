class User < ActiveRecord::Base
  devise :rememberable, :omniauthable

  attr_accessible :email, :password, :name, :calendar_id, :uid, :password_confirmation, :remember_me

  def self.find_for_open_id(access_token, signed_in_resource=nil)
    data = access_token.info
    if user = User.where(:email => data["email"]).first
      user
    else
      User.create!(:email => data["email"], 
                   :name => data["name"], 
                   :calendar_id=>data["email"], 
                   :uid=> data["uid"],
                   :password => Devise.friendly_token[0,20])
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.google_data"] && session["devise.google_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end

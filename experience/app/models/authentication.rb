class Authentication < ActiveRecord::Base
  attr_accessible :provider, :uid, :user_id, :token, :avatar, :refresh_token

  belongs_to :user 

  def self.find_or_create_for_google_yippee(data)
    where(token: data["credentials"]["token"],
          provider: data["provider"]
         ).first_or_create(
                            uid: data["uid"],
                            avatar: data["info"]["image"],
                            refresh_token: data["credentials"]["refresh_token"]
                          )
  end
end 

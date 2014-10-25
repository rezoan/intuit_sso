class User < ActiveRecord::Base

  def self.find_for_open_id(access_token)
    data = access_token.info
    if user = User.where(:email => data["email"]).first
      user
    else
      User.create!(:email => data["email"], :password => generate_token )
    end
  end

  def self.generate_token
    Digest::SHA1.hexdigest("#{Rails.application.config.secret_token}#{Time.now.to_i}")
  end

end

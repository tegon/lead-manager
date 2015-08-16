class User < ActiveRecord::Base
  def self.create_with_salesforce(auth)
    create! do |user|
      user.email = auth["extra"]["email"]
      user.uid = auth["uid"]
      user.access_token = auth["credentials"]["token"]
      user.instance_url = auth["credentials"]["instance_url"]
    end
  end
end
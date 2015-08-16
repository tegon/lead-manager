class User < ActiveRecord::Base
  validates_presence_of :email, :uid, :access_token, :instance_url

  def self.create_with_salesforce(auth)
    create! do |user|
      user.email = auth['extra']['email']
      user.uid = auth['uid']
      user.access_token = auth['credentials']['token']
      user.instance_url = auth['credentials']['instance_url']
    end
  end

  def credentials
    { token: access_token, instance_url: instance_url }
  end
end
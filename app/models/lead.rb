class Lead < ActiveRecord::Base
  validates_presence_of :name, :last_name, :email, :company, :job_title, :phone, :website
end
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :instance_url
      t.string :access_token
      t.string :uid
      t.timestamps
    end
  end
end

class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :cname_domain
      t.string :name
      t.string :subdomain
      t.string :twitter_username
      t.string :facebook_page
      t.integer :owner_id

      t.timestamps
    end
  end
end

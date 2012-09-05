class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :cname_domain
      t.string :name
      t.string :twitter_username
      t.string :facebook_page

      t.timestamps
    end
  end
end

class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.text :provider
      t.boolean :status

      t.timestamps
    end
  end
end

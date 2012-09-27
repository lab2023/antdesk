class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.string :youtube_id
      t.string :width
      t.string :height
      t.boolean :status
      t.timestamps
    end
  end
end

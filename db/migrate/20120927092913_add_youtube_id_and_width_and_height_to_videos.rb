class AddYoutubeIdAndWidthAndHeightToVideos < ActiveRecord::Migration
  def self.up
    add_column :videos, :youtube_id, :string
    add_column :videos, :width, :string
    add_column :videos, :height, :string
    remove_column :videos, :provider
  end
  def self.down
    remove_column :videos, :youtube_id
    remove_column :videos, :width
    remove_column :videos, :height
    add_column :videos, :provider, :text
  end
end

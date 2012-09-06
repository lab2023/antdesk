class Category < ActiveRecord::Base
  attr_accessible :icon_name, :name,:application_id
  has_and_belongs_to_many :articles
  has_and_belongs_to_many :videos
  belongs_to :application
  before_destroy {articles.clear}
  before_destroy {videos.clear}
end

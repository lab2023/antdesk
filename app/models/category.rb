class Category < ActiveRecord::Base
  attr_accessible :icon_name, :name,:application_id

  has_and_belongs_to_many :articles
  has_and_belongs_to_many :videos
  belongs_to :application

  validates_presence_of :name, :icon_name

  before_destroy {articles.clear}
  before_destroy {videos.clear}
end

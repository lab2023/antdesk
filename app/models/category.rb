class Category < ActiveRecord::Base
  attr_accessible :icon_name, :name
  has_and_belongs_to_many :articles
  has_and_belongs_to_many :videos
  belongs_to :applications
end

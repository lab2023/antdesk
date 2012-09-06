class Video < ActiveRecord::Base
  attr_accessible :name, :provider, :category_ids
  has_and_belongs_to_many :categories
end

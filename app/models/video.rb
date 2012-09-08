class Video < ActiveRecord::Base
  attr_accessible :name, :provider, :category_ids, :status

  has_and_belongs_to_many :categories

  validates_presence_of :name, :provider
end

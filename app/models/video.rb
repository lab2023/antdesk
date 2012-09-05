class Video < ActiveRecord::Base
  attr_accessible :name, :provider
  has_and_belongs_to_many :categories
end

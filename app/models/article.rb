class Article < ActiveRecord::Base
  attr_accessible :body, :name, :category_ids

  has_and_belongs_to_many :categories

  validates_presence_of :name, :body
end

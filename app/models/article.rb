class Article < ActiveRecord::Base
  attr_accessible :body, :rendered_body, :name, :category_ids, :status

  has_and_belongs_to_many :categories

  validates_presence_of :name, :body

  markdownize! :body
end

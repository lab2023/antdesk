class Article < ActiveRecord::Base
  attr_accessible :body, :name, :category_ids, :status

  has_and_belongs_to_many :categories

  validates_presence_of :name, :body, :categories

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  def self.search(search)
    where('articles.name LIKE ?', "%#{search}%").where('articles.status == ?', true)
  end

  scope :active, where(:status => true)
end

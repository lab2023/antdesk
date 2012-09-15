class Video < ActiveRecord::Base
  attr_accessible :name, :provider, :category_ids, :status

  has_and_belongs_to_many :categories

  validates_presence_of :name, :provider, :categories

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  def self.search(search)
    where('videos.name LIKE ?', "%#{search}%").where('videos.status == ?', true)
  end

  scope :active, where(:status => true)
end

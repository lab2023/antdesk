class Video < ActiveRecord::Base
  attr_accessible :name, :youtube_id, :width, :height, :category_ids, :status

  has_and_belongs_to_many :categories

  validates_presence_of :name, :youtube_id, :width, :height, :categories

  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]

  def self.search(search)
    where('videos.name LIKE ?', "%#{search}%")
  end

  scope :active, where(:status => true)
end

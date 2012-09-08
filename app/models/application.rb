class Application < ActiveRecord::Base
  attr_accessible :cname_domain, :facebook_page, :name, :twitter_username, :contributor_ids, :logo
  has_and_belongs_to_many :contributors
  has_many :categories, :dependent => :destroy

  has_many :videos, :through  => :categories
  has_many :articles, :through => :categories

  has_attached_file :logo, :default_url => "/assets/missing-image.jpg", :styles => {:small => "100x40#"}

  validates_attachment :logo, :presence => true

  validates_presence_of :cname_domain, :facebook_page, :name, :twitter_username
end

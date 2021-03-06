class Application < ActiveRecord::Base
  attr_accessible :cname_domain, :facebook_page, :name, :twitter_username, :logo, :owner_id, :owner_name, :subdomain
  has_and_belongs_to_many :contributors
  belongs_to :owner, :class_name => 'Contributor', :foreign_key => 'owner_id'
  has_many :categories, :dependent => :destroy

  has_many :videos, :through  => :categories, :uniq => true
  has_many :articles, :through => :categories, :uniq => true

  has_attached_file :logo, :default_url => "/assets/missing-image.jpg", :styles => {:small => "100x40#"}

  validates_attachment :logo, :presence => true
  validates :cname_domain, :uniqueness => true
  validates :subdomain, :uniqueness => true

  validates_presence_of :cname_domain, :facebook_page, :name, :twitter_username, :owner_name, :subdomain

  def owner_name
    owner.try(:name)
  end

  def owner_name=(name)
    self.owner = Contributor.find_by_name(name)
  end
end

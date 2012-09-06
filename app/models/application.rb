class Application < ActiveRecord::Base
  attr_accessible :cname_domain, :facebook_page, :name, :twitter_username, :contributor_ids
  has_and_belongs_to_many :contributors
  has_many :categories, :dependent => :destroy
end

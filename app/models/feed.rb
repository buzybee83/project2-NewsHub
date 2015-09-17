class Feed < ActiveRecord::Base
  has_and_belongs_to_many :users
  validates :title, :feed_url, presence: true

  def index
    @feeds = Feed.all
  end

  def self.get_feed
    the_verge = "http://www.theverge.com/rss/index.xml"
    feed = Feedjira::Feed.fetch_and_parse the_verge
    @feed =  feed.entries
  end

  def feed_name
    "#{title}"
  end

  def to_s
    feed_name
  end
end

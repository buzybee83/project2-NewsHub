class FeedItem
  attr_reader :title, :pub, :summary, :url
  def initialize(title, pub, summary, url)
    @title = title
    @pub = pub
    @summary = summary
    @url = url
  end
end

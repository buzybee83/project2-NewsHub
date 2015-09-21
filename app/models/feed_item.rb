class FeedItem
  attr_reader :title, :pub, :summary, :url, :image
  def initialize(title, pub, image, summary, url)
    @title = title
    @pub = pub
    @summary = summary
    @url = url
    @image = image
  end
end

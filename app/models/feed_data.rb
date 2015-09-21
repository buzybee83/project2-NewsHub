 class FeedData
  def self.verge(data)
    data.entries.map do |item|
      content = item.content.gsub("Continue reading", '').gsub(/&hellip;/, '').gsub(/<a style=.*?>/, '')
      FeedItem.new(item.title, item.published, content, item.url)
    end
  end

  def self.tech_crunch(data)
    # TODO: fix this to work with Tech Crunch
    data.entries.map do |item|
      content = item.summary.gsub("Read More", '')
      FeedItem.new(item.title, item.published, content, item.url)
    end
  end
end

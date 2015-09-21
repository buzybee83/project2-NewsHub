 class FeedData
  def self.verge(data)
    # Parsing The Verge feed
    data.entries.map do |item|
      content = item.content.gsub("Continue reading", '').gsub(/&hellip;/, '').gsub(/<a style=.*?>/, '')
      FeedItem.new(item.title, item.published, content, item.url)
    end
  end

  def self.tech_crunch(data)
    # Parsing Tech Crunch feed
    data.entries.map do |item|
      content = item.summary.gsub("Read More", '')
      FeedItem.new(item.title, item.published, content, item.url)
    end
  end

  def self.gizmodo(data)
    # Parsing Tech Crunch feed
    data.entries.map do |item|
      content = item.summary.gsub("Read more...", '').gsub(/&hellip;/, '')
      FeedItem.new(item.title, item.published, content, item.url)
    end
  end
end

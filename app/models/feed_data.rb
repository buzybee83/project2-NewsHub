 class FeedData
  def self.verge(data)
    # Parsing The Verge feed
    data.entries.map do |item|
      content = item.content.gsub("Continue reading", '').gsub(/&hellip;/, '').gsub(/<a style=.*?>/, '')
      FeedItem.new(item.title, item.published, item.image, content, item.url)
    end
  end

  def self.tech_crunch(data)
    # Parsing Tech Crunch feed
    data.entries.map do |item|
      content = item.summary.gsub("Read More", '').gsub(/<img .*?>/, '')
      FeedItem.new(item.title, item.published, item.image, content, item.url)
    end
  end

  def self.gizmodo(data)
    # Parsing Gizmodo feed
    data.entries.map do |item|
      content = item.summary.gsub("Read more...", '').gsub(/&hellip;/, '')
      FeedItem.new(item.title, item.published, item.image, content, item.url)
    end
  end

  def self.engadget(data)
    # Parsing Engadget feed
    data.entries.map do |item|
      content = item.summary.gsub("Read more...", '').gsub(/&hellip;/, '')
      FeedItem.new(item.title, item.published, item.image, content, item.url)
    end
  end

  def self.nineto5mac(data)
    # Parsing 9to5Mac feed
    data.entries.map do |item|
      image = item.image.gsub("?w=155", "")
      content = item.summary
      FeedItem.new(item.title, item.published, image, content, item.url)

    end
  end

  def self.wired(data)
    # Parsing Engadget feed
    data.entries.map do |item|
      content = item.summary.gsub("Read more...", '').gsub(/&hellip;/, '')
      FeedItem.new(item.title, item.published, item.image, content, item.url)
    end
  end
end

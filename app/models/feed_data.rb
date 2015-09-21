 class FeedData
  def self.verge(data)
    data.entries.map do |item|
      FeedItem.new(item.title, item.published, item.content, item.url)
    end
  end

  def self.tech_crunch(data)
    # TODO: fix this to work with Tech Crunch
    data.entries.map do |item|
      content = 'join stuff here using item.content'
      FeedItem.new(item.title, item.published, content)
    end
  end
end

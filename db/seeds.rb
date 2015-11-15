# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Feed.delete_all

feeds = Feed.create([{title: 'Tech Crunch', feed_url: 'http://www.techcrunch.com/feed/'},
                     {title: 'The Verge', feed_url: 'http://www.theverge.com/rss/index.xml'},
                     {title: 'Gizmodo', feed_url: 'http://gizmodo.com/rss'},
                     {title: '9to5Mac', feed_url: 'http://9to5mac.com/feed/'},
                     {title: 'Wired', feed_url: 'http://www.wired.com/rss'},
                     {title: 'Engadget', feed_url: 'http://www.engadget.com/rss-full.xml'},
                     {title: 'Lifehacker', feed_url: 'http://lifehacker.com/rss'},
                     {title: 'Re/code', feed_url: 'http://recode.net/feed/'}                                          
                     ])

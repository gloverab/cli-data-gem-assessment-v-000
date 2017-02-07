class Reply
  attr_accessor :parent_tweet, :author, :content

  def initialize(parent_tweet)
    @parent_tweet = parent_tweet
  end

  def author
    @author = self.parent_tweet.doc.css('.stream-items .stream-item-header b')[0].text
  end

  def content
    @content = self.parent_tweet.doc.css('.stream-items p')[0].text
  end

  def time
    #binding.pry
    self.parent_tweet.doc.css('.stream-items .stream-item-header .time a')[0].values[2].split(" - ")[0]
  end

  def date
    self.parent_tweet.doc.css('.stream-items .stream-item-header .time a')[0].values[2].split(" - ")[1]
  end

  def show_five
    puts "\n#{self.display_name.upcase}'S MOST RECENT TWEETS:\n"
    @counter = 0
    until self.counter == 5
      tweet_cycle
    end
  end

end

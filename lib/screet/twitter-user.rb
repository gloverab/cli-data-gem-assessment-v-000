require_relative '../../config/environment.rb'

class TwitterUser
  attr_accessor :username, :doc, :profile_name, :counter

  @@tweets = []

  def initialize(username)
    html = open("https://twitter.com/#{username}")
    @doc = Nokogiri::HTML(html)
    @username = username
    @profile_name = @doc.css('.ProfileHeaderCard-nameLink').text.strip
  end

  def show_five
    puts "\n#{self.profile_name.upcase}'S MOST RECENT TWEETS:\n"
    @counter = 0
    until self.counter == 5
      tweet_cycle
    end
  end

  def get_tweet
    user = self
    author_name = self.username
    counter = self.counter
    path = self.doc.css('.js-stream-tweet')[0].values[3]
    url = "https://www.twitter.com#{path}"
    @@tweets << Tweet.new(url, user)
  end

  def five_more
    this_counter = counter + 5
    until counter == this_counter
      tweet_cycle
    end
    give_options
  end

  def tweet_cycle
    tweet
    get_tweet
    self.counter += 1
  end

  def tweet
    puts "#{(self.counter + 1).to_s}. #{self.doc.css('.time')[0].text.strip} -- #{self.doc.css('.stream p')[counter].text}\n"
    puts " "
  end

  def similar_users

  end

end

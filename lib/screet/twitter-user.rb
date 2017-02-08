require_relative '../../config/environment.rb'

class TwitterUser
  attr_accessor :user_name, :doc, :display_name, :counter, :tweets

  def initialize(user_name)
    html = open("https://twitter.com/#{user_name}")
    @doc = Nokogiri::HTML(html)
    @user_name = user_name
    @display_name = @doc.css('.ProfileHeaderCard-nameLink').text.strip
    @tweets = []
  end

  def show_five
    puts "\n#{self.display_name.upcase}'S MOST RECENT TWEETS:\n"
    @counter = 0
    until self.counter == 5
      tweet_cycle
    end
  end

  def five_more
    this_counter = counter + 5
    until counter == this_counter
      tweet_cycle
    end
  end

  def redisplay
    self.tweets.each_with_index do |tweet, index|
      puts "#{(index+1).to_s}. #{tweet.time} -#{"**RETWEET**" if tweet.retweeted?}- #{tweet.content}"
      puts " "
    end
  end

  def tweet_cycle
    get_tweet
    tweet
    self.counter += 1
  end

  def tweet
    puts "#{(self.counter + 1).to_s}. #{self.doc.css('.time')[counter].text.strip} -#{"**RETWEET**" if tweets[counter].retweeted?}- #{self.doc.css('.js-tweet-text-container p')[counter].text}\n"
    puts " "
  end

  def get_tweet
    user = self
    path = self.doc.css('.js-stream-tweet')[counter].values[3]
    url = "https://www.twitter.com#{path}"
    self.tweets << Tweet.new(url, user)
  end

  def similar_users
    binding.pry
    display_name = self.doc.css('.related-users .fullname')[0].text
    user_name = self.doc.css('.related-users .username')[0].text
  end

end

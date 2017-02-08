class ScreetCLI

  attr_accessor :user, :tweet

  def initialize
    puts " "
    puts "************ | TWITERATOR v0.1 | ************"
    puts "\nHi there! I'm Twiterator, a Ruby cli scraper for"
    puts "the popular social networking site, Twitter."
    puts "You can type in any username at all"
    puts "and I will display that user's most recent tweets."
    puts "From there, you'll be able to view that user's"
    puts "followers, who they're following, and see the"
    puts "replies, retweets, and likes for each inidividual tweet."
    what_user
  end

  def what_user
    puts "\nNow, please enter either a username."
    puts "There's no need to put the '@' sign."
    puts "(ex. 'tameimpala' or 'deadmau5')"
    @user = TwitterUser.new(gets.strip)
    self.user.show_five
    give_options
  end

  def give_options
    puts "-To see more tweets, type 'more.'"
    puts "-To check out a different user's tweets, type 'new'"
    puts "-To learn more about a tweet, simply type the number of the tweet you'd like to learn about."
    options_response
  end

  def display_tweet(index)
    tweet_number = index-1
    @tweet = self.user.tweets[tweet_number]
    puts "-------------"
    puts "On #{tweet.date}, at approximately #{tweet.time} #{tweet.user_name} wrote:"
    puts "'#{tweet.content}'"
    puts "-----"
    puts "#{tweet.reply_count} people replied to this tweet."
    puts "#{tweet.retweets} people retweeted."
    puts "#{tweet.likes} people liked it."
    puts "--"
    tweet_options
  end

  def tweet_options
    puts "To view some of the replies to this tweet, type 'replies'"
    puts "To see more tweets from this user, type 'more'"
    puts "To check out a different user's tweets, type 'new'"
    set_replies
    tweet_response
  end

  def set_replies
    self.tweet.set_replies
  end

  def options_response
    answer = gets.strip.upcase
    if answer == "MORE"
      self.user.five_more
      give_options
    elsif answer == "NEW"
      what_user
    elsif answer.to_i > 0
      display_tweet(answer.to_i)
    end
  end

  def tweet_response
    answer = gets.strip.upcase
    if answer == "REPLIES"
      show_replies
    elsif answer == "MORE"
      self.user.five_more
      give_options
    elsif answer == "BACK"
      self.user.redisplay
      give_options
    elsif answer == "NEW"
      what_user
    end
  end

  def show_replies
    self.tweet.replies.each_with_index do |reply, index|
      puts "#{index+1}. #{reply.content}\n"
    end
    puts "---"
    puts "To redisplay #{self.user.user_name}'s tweets, type 'back'"
    puts "OR"
    puts "To search for a new tweeter, type 'new'"
    tweet_response
  end

end

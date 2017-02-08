class ScreetCLI

  attr_accessor :user, :tweet

  def initialize
    puts " "
    puts "************ | SCREET v0.1 | ************"
    puts "\nHi there! I'm Screet, a Ruby cli scraper for"
    puts "the popular social networking site, Twitter."
    puts "You can type in any username at all"
    puts "and I will display that user's 10 most recent tweets."
    puts "From there, you'll be able to view that user's"
    puts "followers, who they're following, and even see"
    puts "who favorited or retweeted their recent tweets."
    what_user
  end

  def what_user
    puts "\nNow, please enter either a username."
    puts "There's no need to put the '@' sign."
    puts "(ex. 'beyonce' or 'timheidecker')"
    @user = TwitterUser.new(gets.strip)
    self.user.show_five
    give_options
  end

  def give_options
    puts "-To see more tweets, type 'more.'"
    puts "-To see a list of similar twitter users, type 'similar.'"
    puts "-To learn more about a tweet, simply type the number of the tweet you'd like to learn about."
    answer = gets.strip.upcase
    if answer == "MORE"
      self.user.five_more
      give_options
    # elsif answer == "SIMILAR"
    #   self.user.similar_users
    elsif answer.to_i > 0
      display_tweet(answer.to_i)
    end
  end

  def display_tweet(index)
    tweet_number = index-1
    @tweet = self.user.tweets[tweet_number]
    puts "--"
    puts "On #{tweet.date}, at approximately #{tweet.time} #{tweet.user_name} wrote:"
    puts "'#{tweet.content}'"
    puts "**"
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

  def tweet_response
    answer = gets.strip.upcase
    if answer == "REPLIES"
      show_replies
    elsif answer == "BACK"
      self.user.redisplay
      give_options
    end
  end

  def show_replies
    self.tweet.replies.each do |reply|
      puts "#{reply.content}\n"
    end
    puts "--"
    puts "type 'back' to redisplay #{self.user.user_name}'s tweets"
    tweet_response
  end

end

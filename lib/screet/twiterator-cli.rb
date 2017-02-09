class ScreetCLI

  attr_accessor :user, :tweet

  def initialize
    puts " "
    puts "************ | TWITERATOR v0.02 | ************"
    puts "\nHi there! I'm Twiterator, a Ruby cli scraper for"
    puts "the popular social networking site, Twitter."
    puts "You can type in any username at all, and I will"
    puts "display that user's basic info along with their most"
    puts "recent tweets. From there, you'll be able to dive into"
    puts "each tweet and play around until your thirst for"
    puts "knowledge of the twitterverse is quenched."
    new_user_menu
  end

  def new_user_menu
    puts "\nNow, please enter a username."
    puts "There's no need to put the '@' sign, but I won't complain if you do."
    puts "(ex. 'realcarrotfacts' or 'kanyewest')"
    @user = User.new(gets.strip)
    display_profile
  end

  def display_profile
    puts " "
    puts "#{self.user.display_name.upcase} - @#{self.user.user_name}"
    puts "#{self.user.following_count}"
    puts "#{self.user.follower_count}"
    puts " "
    if self.user.private?
      puts "Out of respect for this user's privacy, I'm not willing to display their tweets at this time."
      new_user_menu
    else
      self.user.show_five
      give_options
    end
  end

  def give_options
    puts "-To see more of #{self.user.display_name}'s tweets, type 'more.'"
    puts "-To check out a different user's tweets, type 'new'"
    puts "-To learn more about a tweet, simply type the number of the tweet you'd like to learn about."
    #options_response
    tweet_response
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
    puts "To see more tweets from #{self.user.display_name}, type 'more'"
    puts "To check out a different user's tweets, type 'new'"
    set_replies
    tweet_response
  end

  def set_replies
    self.tweet.set_replies
  end

  # def options_response
  #   answer = gets.strip.upcase
  #   if answer == "MORE"
  #     self.user.five_more
  #     give_options
  #   elsif answer == "NEW"
  #     new_user_menu
  #   elsif answer.to_i > 0
  #     display_tweet(answer.to_i)
  #   end
  # end

  def tweet_response
    answer = gets.strip.upcase
    if answer == "REPLIES" && self.tweet != nil
      show_replies
    elsif answer == "MORE"
      self.user.five_more
      give_options
    elsif answer == "BACK"
      self.user.redisplay
      give_options
    elsif answer == "NEW"
      new_user_menu
    elsif answer.to_i > 0
      display_tweet(answer.to_i)
    else
      puts "Uh oh!! I don't know what you're trying to say! Sorry about that."
      give_options
    end
  end

  def show_replies
    self.tweet.replies.each_with_index do |reply, index|
      puts "#{index+1}. #{reply.content}\n"
    end
    puts "---"
    puts "To redisplay #{self.user.display_name}'s tweets, type 'back'"
    puts "OR"
    puts "To search for a new tweeter, type 'new'"
    tweet_response
  end

end

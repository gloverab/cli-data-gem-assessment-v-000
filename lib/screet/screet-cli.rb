class ScreetCLI

  attr_accessor :user

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
    elsif answer == "SIMILAR"
      self.user.similar_users
    elsif answer.to_i > 0
      # puts self.user.tweets[answer.to_i]
      display_tweet(answer.to_i)
    end
  end

  def display_tweet(tweet_number)
    puts "On #{self.user.tweets[tweet_number].date}, #{self.user.tweets[tweet_number].date} wrote:"
    puts "#{self.user.tweets[tweet_number].content}"

  end

end

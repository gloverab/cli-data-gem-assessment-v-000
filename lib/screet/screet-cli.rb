class ScreetCLI

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
    TwitterUser.new(gets.strip)
  end

end

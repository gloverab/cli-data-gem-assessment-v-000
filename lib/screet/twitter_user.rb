require 'open-uri'
require 'pry'

class TwitterUser
  attr_accessor :doc, :profile_name, :counter

  def initialize(username)
    html = Kernel.open("https://twitter.com/#{username}")
    @doc = Nokogiri::HTML(html)
    @profile_name = @doc.css('.ProfileHeaderCard-nameLink').text.strip
    @counter = 0
    show_five
  end

  def show_five
    puts "\n#{self.profile_name.upcase}'S MOST RECENT TWEETS:\n"
    until @counter == 5
      puts "#{(counter + 1).to_s}. #{self.doc.css('.time')[0].text.strip} -- #{self.doc.css('.stream p')[counter].text}\n"
      puts " "
      @counter += 1
    end
    give_options
  end

  def give_options
    puts "-To see more tweets, type 'more.'"
    puts "-To see a list of similar twitter users, type 'similar.'"
    puts "-To see who responded to these tweets, type the number of the tweet you'd like more info on."
    answer = gets.strip.upcase
    if answer == "MORE"
      five_more
    elsif answer == "SIMILAR"
      similar_users
    elsif answer.to_i.is_a?(Integer)
      puts "fuck off"
    end
  end

  def five_more

  end

  def similar_users

  end

end

require_relative '../../config/environment.rb'

class Tweet
  attr_accessor :url, :user, :user_name, :counter, :content, :date, :replies, :favorites

  attr_reader :retweets, :likes

  def initialize(url, user=nil)
    html = open(url)
    doc = Nokogiri::HTML(html)
    @url = url
    @user = user
    @content = doc.css('.js-tweet-text-container p')[0].text
    #binding.pry
    @user_name = doc.css('.js-action-profile-name b')[0].text.strip
    @date = doc.css('.client-and-actions').text.strip
    @replies = []
    @retweets = doc.css('.request-retweeted-popup strong').text
    @likes = doc.css('.js-stat-favorites strong').text
  end

  def replies

  end

end

require_relative '../../config/environment.rb'

class Tweet
  attr_accessor :display_name, :replies

  attr_reader :html, :doc, :url, :user, :user_name, :content, :time, :date, :retweets, :likes

  def initialize(url, user=nil)
    @html = open(url)
    @doc = Nokogiri::HTML(html)
    @url = url
    @user = user
    @content = doc.css('.js-tweet-text-container p')[0].text
    @display_name = doc.css('.permalink-header fullname').text
    @user_name = doc.css('.js-action-profile-name b')[0].text.strip
    @time = doc.css('.client-and-actions').text.strip.split(" - ")[0]
    @date = doc.css('.client-and-actions').text.strip.split(" - ")[1]
    @replies = []
    @retweets = doc.css('.request-retweeted-popup strong').text
    @likes = doc.css('.js-stat-favorites strong').text
  end

  def replies
    parent_tweet = self
    @replies << Reply.new(parent_tweet)

    #self.doc.css('.stream-items .stream-item-header b')[0].text
  end

end

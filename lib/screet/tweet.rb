require_relative '../../config/environment.rb'

class Tweet
  attr_accessor :url, :user, :user_name, :counter, :content, :date, :replies, :retweets, :favorites

  def initialize(url, user=nil)
    html = open(url)
    doc = Nokogiri::HTML(html)
    @url = url
    @user = user
    @content = doc.css('.js-tweet-text-container p')[0].text
    @user_name = doc.css('.username .js-action-profile-name').text
  end

end

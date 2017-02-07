require_relative '../config/environment.rb'

describe "Tweet" do
  tweet = Tweet.new('https://twitter.com/whoisMGMT/status/820115772554907648')

  describe '#initialize' do
    it "Initializes with all attributes of a tweet." do

      expect(tweet.url).to eq("https://twitter.com/whoisMGMT/status/820115772554907648")

      expect(tweet.content).to eq("Time to get serious")

      expect(tweet.user_name).to eq("whoisMGMT")

      expect(tweet.user).to eq(nil)
    end
  end

end
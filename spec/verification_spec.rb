require_relative '../config/environment.rb'

describe "Reply" do
  bad_verify = Verification.new('lkasdfkjgkjl')
  good_verify = Verification.new('kanywest')

  describe '#initialize' do
    it "Initializes with a username to check later on." do

      #a lot of these values change on aminute-to-minute basis because of he immediate nature of twitter.
      expect(bad_verify.verify).to be_falsey
      expect(good_verify.verify).to be_truthy
    end
  end

end

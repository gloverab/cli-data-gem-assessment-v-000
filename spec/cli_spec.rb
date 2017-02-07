require_relative '../config/environment.rb'

describe "Rubbit" do

  describe '#initialize' do
    it "Initializes with 'Alright!'" do
      expect { Rubbit.new }.to output("Alright!\n").to_stdout
    end
  end

end

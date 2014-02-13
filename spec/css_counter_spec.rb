require 'rspec'
require 'css_counter'

describe CssCounter do

  describe "#count" do
    context "with simple.css" do
      let!(:input) { File.read(File.dirname(__FILE__) + "/fixtures/simple.css") }
      subject { CssCounter.count(input) }

      it { should == 1 }
    end
  end
end

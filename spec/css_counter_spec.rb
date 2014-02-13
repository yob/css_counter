require 'css_counter'

describe CssCounter do

  describe "#count" do
    context "with simple.css" do
      let!(:input) { File.read(File.dirname(__FILE__) + "/fixtures/simple.css") }
      subject { CssCounter.count(input) }

      it { should == 1 }
    end

    context "with simple-two.css" do
      let!(:input) { File.read(File.dirname(__FILE__) + "/fixtures/simple-two.css") }
      subject { CssCounter.count(input) }

      it { should == 2 }
    end

    context "with simple-three.css" do
      let!(:input) { File.read(File.dirname(__FILE__) + "/fixtures/simple-three.css") }
      subject { CssCounter.count(input) }

      it { should == 3 }
    end

    context "with multiple.css" do
      let!(:input) { File.read(File.dirname(__FILE__) + "/fixtures/multiple.css") }
      subject { CssCounter.count(input) }

      it { should == 2 }
    end

    context "with mediaquery.css" do
      let!(:input) { File.read(File.dirname(__FILE__) + "/fixtures/mediaquery.css") }
      subject { CssCounter.count(input) }

      it { should == 2 }
    end

    context "with mediaquery.css" do
      let!(:input) { File.read(File.dirname(__FILE__) + "/fixtures/tc-application.css") }
      subject { CssCounter.count(input) }

      # TODO blesscss reports this file has 4467 selectors. Who is correct?
      #it { should == 4467 }
      it { should == 4326 }
    end
  end
end

require 'css_counter'

describe CssCounter do

  describe "#count" do
    context "with simple.css" do
      let!(:input) { File.read(File.dirname(__FILE__) + "/fixtures/simple.css") }
      subject { CssCounter.new(input).selectors }

      it { should == 1 }
    end

    context "with simple-two.css" do
      let!(:input) { File.read(File.dirname(__FILE__) + "/fixtures/simple-two.css") }
      subject { CssCounter.new(input).selectors }

      it { should == 2 }
    end

    context "with simple-three.css" do
      let!(:input) { File.read(File.dirname(__FILE__) + "/fixtures/simple-three.css") }
      subject { CssCounter.new(input).selectors }

      it { should == 3 }
    end

    context "with multiple.css" do
      let!(:input) { File.read(File.dirname(__FILE__) + "/fixtures/multiple.css") }
      subject { CssCounter.new(input).selectors }

      it { should == 2 }
    end

    context "with mediaquery.css" do
      let!(:input) { File.read(File.dirname(__FILE__) + "/fixtures/mediaquery.css") }
      subject { CssCounter.new(input).selectors }

      it { should == 3 }
    end

    context "with charset.css" do
      let!(:input) { File.read(File.dirname(__FILE__) + "/fixtures/charset.css") }
      subject { CssCounter.new(input).selectors }

      it { should == 1 }
    end

    context "with font-face.css" do
      let!(:input) { File.read(File.dirname(__FILE__) + "/fixtures/font-face.css") }
      subject { CssCounter.new(input).selectors }

      it { should == 2 }
    end

    context "with keyframes.css" do
      let!(:input) { File.read(File.dirname(__FILE__) + "/fixtures/keyframes.css") }
      subject { CssCounter.new(input).selectors }

      it { should == 9 }
    end

    context "with tc-application.css" do
      let!(:input) { File.read(File.dirname(__FILE__) + "/fixtures/tc-application.css") }
      subject { CssCounter.new(input).selectors }

      # TODO blesscss reports this file has 4467 selectors. Who is correct?
      #it { should == 4467 }
      it { should == 4461 }
    end
  end
end

require 'spec_helper'

describe Rating do
  
  before(:each) do
    @mp3 = Factory(:mp3)
    @attr = { :value => "4" }
  end
  
  it "should create a new instance given valid attributes" do
    @mp3.ratings.create!(@attr)
  end
  
  describe "user associations" do
    
    before(:each) do
      @rating = @mp3.ratings.create(@attr)
    end
    
    it "should have a mp3 attribute" do
      @rating.should respond_to(:mp3)
    end
    
    it "should have the right associated user" do
      @rating.mp3_id.should == @mp3.id
      @rating.mp3.should == @mp3
    end
  end
  
  describe "validations" do
    
    it "should require a user id" do
      Rating.new(@attr).should_not be_valid
    end
    
    it "should require nonblank content" do
      @mp3.ratings.build(:content => " ").should_not be_valid
    end
    
    it "should require a number only" do
      @mp3.ratings.build(:content => "d").should_not be_valid
    end
    
    it "should require a whole number only" do
      @mp3.ratings.build(:content => "2.2").should_not be_valid
    end
    
    it "should be greater than zero" do
      @mp3.ratings.build(:content => "0").should_not be_valid
    end
    
    it "should be 5 or less" do
      @mp3.ratings.build(:content => "6").should_not be_valid
    end
  end
end

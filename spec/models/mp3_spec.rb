# == Schema Information
#
# Table name: mp3s
#
#  id         :integer         not null, primary key
#  url        :string(255)
#  title      :string(255)
#  artist     :string(255)
#  length     :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Mp3 do
  
  before(:each) do
    @attr = { :url => "Example Mp3 url", :title => "Example Title", :artist => "Example artist", :length => "10"}
  end
  
  it "should create a new instance given valid attributes" do
    Mp3.create!(@attr)
  end
  
  it "should require a title" do
    no_title_mp3 = Mp3.new(@attr.merge(:title => ""))
    no_title_mp3.should_not be_valid
  end

  it "should reject urls that are too long" do
      long_url = "a" * 51
      long_url_mp3 = Mp3.new(@attr.merge(:url => long_url))
      long_url_mp3.should_not be_valid
  end
  
  it "should reject names that are too long" do
      long_name = "a" * 51
      long_name_mp3 = Mp3.new(@attr.merge(:url => long_name))
      long_name_mp3.should_not be_valid
  end
  
  it "should reject artists that are too long" do
      long_artist = "a" * 51
      long_artist_mp3 = Mp3.new(@attr.merge(:url => long_artist))
      long_artist_mp3.should_not be_valid
  end
  
  it "should reject duplicate songs by same artist" do
      # Put a song with the same artist into the database.
      Mp3.create!(@attr)
      duplicate_song = Mp3.new(@attr)
      duplicate_song.should_not be_valid
    end
    
    it "length should require a number only" do
      double_length = "d"
      double_length_mp3 = Mp3.new(@attr.merge(:length => double_length))
      double_length_mp3.should_not be_valid
    end
    
    it "length should require a whole number only" do
      double_length = "2.2"
      double_length_mp3 = Mp3.new(@attr.merge(:length => double_length))
      double_length_mp3.should_not be_valid
    end
    
    it "length should require a whole number only" do
      double_length = "22"
      double_length_mp3 = Mp3.new(@attr.merge(:length => double_length))
      double_length_mp3.should be_valid
    end
    
    describe "ratings associations" do
      
      before (:each) do
        @mp3 = Mp3.create(@attr)
        @rating1 = Factory(:rating, :mp3 => @mp3)
        #@rating2 = Rating.new(:value => "2", :mp3_id => @mp3.id))
      end
      
      it "should have a ratings attribute" do
        @mp3.should respond_to(:ratings)
      end
      
      it "should destroy associated ratings" do
        @mp3.destroy
        [@rating1].each do |rating|
          Rating.find_by_id(rating.id).should be_nil
        end
      end
      
      #it "should show the average rating value" do
      #  @mp3.rating.should equal("3")
      #end
        
      
      #it "should raise an exception finding ratings for a song which has been deleted"
      #lambda do
      #  Rating.find(@rating1.id)
      #end.should raise_error(ActiveRecord:RecordNotFound)
    end
end

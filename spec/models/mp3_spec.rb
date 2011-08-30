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
    @attr = { :url => "Example Mp3 url", :title => "Example Title", :artist => "Example artist", :length => 1}
  end
  
  it "should create a new instance given valid attributes" do
    Mp3.create!(@attr)
  end
  
  it "should require a title" do
    no_title_mp3 = Mp3.new(@attr.merge(:title => ""))
    no_title_mp3.should_not be_valid
  end
  
  it "should require an artist" do
    no_title_mp3 = Mp3.new(@attr.merge(:artist => ""))
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
      # Put a user with given email address into the database.
      Mp3.create!(@attr)
      duplicate_song = Mp3.new(@attr)
      duplicate_song.should_not be_valid
    end
end

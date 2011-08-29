require 'spec_helper'

describe PagesController do
  render_views
  
  before(:each) do
      #
      # Define @base_title here.
      #
      @base_title = "Upload and Rate MP3s App"
    end

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
    
    it "should have the right title" do
      get 'home'
      response.should have_selector("title",
                        :content => @base_title + " | Home")
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
    
    
    it "should have the right title" do
      get 'about'
      response.should have_selector("title",
                        :content => @base_title + " | About Us")
    end
  end

  describe "GET 'edit'" do
    it "should be successful" do
      get 'edit'
      response.should be_success
    end
    
    
    it "should have the right title" do
      get 'edit'
      response.should have_selector("title",
                        :content => @base_title + " | Edit Playlist")
    end
  end

  describe "GET 'rate'" do
    it "should be successful" do
      get 'rate'
      response.should be_success
    end
    
    
    it "should have the right title" do
      get 'rate'
      response.should have_selector("title",
                        :content => @base_title + " | Rate MP3")
    end
  end

  describe "GET 'help'" do
    it "should be successful" do
      get 'help'
      response.should be_success
    end
    
    
    it "should have the right title" do
      get 'help'
      response.should have_selector("title",
                        :content => @base_title + " | Help")
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
    
    
    it "should have the right title" do
      get 'contact'
      response.should have_selector("title",
                        :content => @base_title + " | Contact Us")
    end
  end

  describe "GET 'search'" do
    it "should be successful" do
      get 'search'
      response.should be_success
    end
    
    
    it "should have the right title" do
      get 'search'
      response.should have_selector("title",
                        :content => @base_title + " | Search Playlist")
    end
  end

end

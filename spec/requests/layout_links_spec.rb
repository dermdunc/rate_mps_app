require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end

  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => "Contact Us")
  end

  it "should have an About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => "About Us")
  end

  it "should have a Help page at '/help'" do
    get '/help'
    response.should have_selector('title', :content => "Help")
  end
  
  it "should have an Editing page at '/edit'" do
    get '/edit'
    response.should have_selector('title', :content => "Edit Playlist")
  end

  it "should have an Rating page at '/rate'" do
    get '/rate'
    response.should have_selector('title', :content => "Rate MP3")
  end

  it "should have a Search page at '/search'" do
    get '/search'
    response.should have_selector('title', :content => "Search Playlist")
  end
  
  it "should have the right links on the layout" do
      visit root_path
      click_link "About"
      response.should have_selector('title', :content => "About Us")
      click_link "Help"
      response.should have_selector('title', :content => "Help")
      click_link "Contact"
      response.should have_selector('title', :content => "Contact Us")
      click_link "Home"
      response.should have_selector('title', :content => "Home")
      click_link "Ratings"
      response.should have_selector('title', :content => "Rate MP3")
      click_link "Search"
      response.should have_selector('title', :content => "Search Playlist")
      click_link "Playlist"
      response.should have_selector('title', :content => "Edit Playlist")
    end
end

class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def about
    @title = "About Us"
  end

  def edit
    @title = "Edit Playlist"
  end

  def rate
    @title = "Rate MP3"
  end

  def help
    @title = "Help"
  end

  def contact
    @title = "Contact Us"
  end

  def search
    @title = "Search Playlist"
  end

end

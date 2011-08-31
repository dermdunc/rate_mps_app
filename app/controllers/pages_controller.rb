class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def about
    @title = "About Us"
  end
  
  def data
  		@mp3s = Mp3.all()
  end
  
  def dbaction
  	#called for all db actions
  	title   = params["c0"]
  	artist	= params["c1"]
  	url			= params["c2"]
  	length	= params["c3"]

  	@mode = params["!nativeeditor_status"]

  	@id = params["gr_id"]
  	case @mode
  		when "inserted"
  			mp3         = Mp3.new
  			mp3.title   = title
  			mp3.artist  = artist
  			mp3.url     = url
  			mp3.length  = length
  			mp3.save!

  			@tid = mp3.id
  		when "deleted"
  			mp3 = Mp3.find(@id)
  			mp3.destroy

  			@tid = @id
  		when "updated"
  			mp3         = Mp3.find(@id)
  			mp3.title   = title
  			mp3.artist  = artist
  			mp3.url     = url
  			mp3.length  = length
  			mp3.save!

  			@tid = @id
  	end 
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

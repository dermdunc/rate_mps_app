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
  	length	= params["c3"].to_i
  	rating_value  = params["c5"].to_i

  	@mode = params["!nativeeditor_status"]

  	@id = params["gr_id"]
  	case @mode
  		when "inserted"
  			mp3         = Mp3.new
  			mp3.title   = title
  			mp3.artist  = artist
  			mp3.url     = url
  			if length > 0
  			  mp3.length  = length
			  end
  			mp3.save!
  			
  			
  		  if rating_value > 0
  		    if rating_value < 6
  			    rating = Rating.new
  			    rating.value = rating_value
  			    rating.mp3_id = @id
  			    rating.save!
			    end
  			end
  			
  			mp3.save!

  			@tid = mp3.id
  		when "deleted"
  			mp3 = Mp3.find(@id)
  			mp3.destroy

  			@tid = @id
  		when "updated"
  		  
  		  if rating_value > 0
  		    if rating_value < 6
    		    rating = Rating.new
    			  rating.value = rating_value
    			  rating.mp3_id = @id
    			  rating.save!
			    else
			      flash.now[:error] = "Rating must be between 1 and 5"
			    end
    		end
    		
  			mp3         = Mp3.find(@id)
  			mp3.title   = title
  			mp3.artist  = artist
  			mp3.url     = url
  			if length > 0
  			  mp3.length  = length
			  end   		
    		mp3.save!

  			@tid = @id
  	end 
  	#render(:update) { |page| page.call '/edit' }
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

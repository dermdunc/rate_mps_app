class Mp3sController < ApplicationController

  def show
    @mp3 = Mp3.find(params[:id])
  end

end
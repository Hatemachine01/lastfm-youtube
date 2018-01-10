class StaticController < ApplicationController
  include LastFm
	before_action :set_songs, only: [:controls]
  def homepage
    @username = Username.new
  end

  def api_lookup
  	@username = Username.new(user_params)
  	 if  @username.valid?
  	   	#here we call the class method 
        @songs = LastFm.api_call(@username.username)
        render :index
  	 else
  	 	  render :homepage
  	 end
  end

  def display
    #needs refactoring
    @song = params['song'] 
    @username = params['username'] 
  end

  def controls
    p @songs
    p next_track = params['next']
    p current_strack_index = @songs.index(next_track)
    @song = @songs[current_strack_index + 1]  
    
  end

private 

  def set_songs
    @songs = LastFm.api_call(params[:username])
  end
		 
	def user_params
		params.require(:username).permit(:username)
	end
end

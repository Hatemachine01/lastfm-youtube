class StaticController < ApplicationController
  include LastFm
	
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
  end

private 
		 
	def user_params
		params.require(:username).permit(:username)
	end
end

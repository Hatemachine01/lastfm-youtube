class UsernamesController < ApplicationController

	
  def new
    @username = Username.new
  end

  def create
   @username = Username.new(user_params)
    if @username.returning_user(@username.username)
       @songs = @username.returning_user(@username.username)
       render :index
    elsif @username.save
    	 #here we call the class method 
       @songs =  @username.user_songs(@username.username)
       render :index
     else
    	 render :new
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



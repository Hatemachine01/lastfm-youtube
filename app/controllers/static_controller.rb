class StaticController < ApplicationController
	
  def homepage
    @username = Username.new
  end

  def api_lookup
  	@username = Username.new(user_params)
  	 if @username.valid?
  	   	#here we call the class method 
  	 else
  	 	render :homepage
  	 end
  end

private 
		 
	def user_params
		params.require(:username).permit(:username)
	end
end

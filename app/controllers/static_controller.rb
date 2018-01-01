class StaticController < ApplicationController
	
  def homepage
  end

  def api_lookup
  	word = Username.new(user_params)
  	 if word.valid?
  	   	'WORKS!'
  	 else
  	 	redirect_to root_path
  	 end
  end

private 
		 
	def user_params
		params.require(:username).permit(:username)
	end
end

class StaticController < ApplicationController


  def homepage
  end

  

  def api_lookup
  	p user_params
  end

private 
		 
	def user_params
		params.require(:user).permit(:username)
	end
end

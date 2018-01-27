class UsernamesController < ApplicationController
before_action :set_user, only: [:shuttle  ]
	
  def new
    @username = Username.new
  end

  def create
  #needs refactoring
   @username = Username.new(user_params)
   if @username.username_valid?(@username.username)
      if @username.returning_user(@username.username)
         session[:username] =  @username.username
         redirect_to usernames_path , remote: true
      elsif @username.save
      	 #here we call the class method 
         @songs =  @username.user_songs(@username.username).page(params[:page]).per(20)
         session[:username] =  @username.username
         redirect_to usernames_path
       else
      	 render :new
       end
    else
    redirect_to '/'
    end
  end

  def index
    @username = Username.find_by_username(session[:username])
    @songs = @username.returning_user(@username.username).page(params[:page]).per(20)
  end


  def display
    #needs refactoring
    @song = params['song']
    @user = Username.find_by_username(params[:username]) 
  end


  def shuttle
    #needs refactoring  
    user_songs = Song.where("username_id = ?", @user.id ).to_a 
    user_songs.sample(1).each do |track|
      @song = track.title
    end
  end

private 
		 
  def set_user
   @user = Username.find_by_id(params[:username])
  end

	def user_params
		params.require(:username).permit(:username)
	end
end



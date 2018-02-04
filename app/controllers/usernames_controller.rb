class UsernamesController < ApplicationController
before_action :set_user, only: [:shuttle  ]
 $previous_songs = []
  
  def new
    @username = Username.new
  end

  def create
  #needs refactoring
   @username = Username.new(user_params)
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
      if $previous_songs.length < 0
        $previous_songs << track
        return @song = track.title
      else   
        repetition_free = user_songs - $previous_songs
        repetition_free.sample(1).each do |new_song|
          $previous_songs << new_song
          return @song = new_song.title
        end
      end
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




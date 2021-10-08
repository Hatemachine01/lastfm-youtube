class UsernamesController < ApplicationController
before_action :set_user, only: [:shuttle ]
 $previous_songs = []
  
  def new
    @username = Username.new
  end

  def create
  #needs refactoring
   @username = Username.new(user_params)
      if @username.returning_user(@username.username) #checks if username already exists and gets songs locally if it exists
         session[:username] =  @username.username
         redirect_to usernames_path , remote: true
      elsif @username.save
      	 #if username does no exists it creates it and calls the user songs method to retrieve songs using lastfms API
         @songs =  @username.user_songs(@username.username).page(params[:page]).per(20)
         session[:username] =  @username.username
         redirect_to usernames_path
       else
        #if username failed any validations it render the form again
      	 render :new
       end
  end


  def index
    #once user reaches index page they must have already passed all validations and their songs have already been retrieved or saved. They are consired a returning user and their songs are rertieved from local DB using the returning_user instance method
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
          if $previous_songs.length == 30
             $previous_songs = []
          end
          return @song = new_song.title
        end
      end
    end
  end

  def spotify
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    # Now you can access user's private data, create playlists and much more

    # Access private data
    spotify_user.country #=> "US"
    spotify_user.email   #=> "example@email.com"
    
    redirect_to '/'
  end





  private 


		 
  def set_user
   @user = Username.find_by_id(params[:username])
  end

  def user_params
   params.require(:username).permit(:username)
  end
end




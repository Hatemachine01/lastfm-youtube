class Username < ApplicationRecord
include LastFm
has_many :songs


#validations
validates :username,  presence: true
validates_length_of :username, :minimum => 1, :maximum => 15
validates_uniqueness_of :username

 


 def returning_user(username)
 	if user = Username.find_by_username(username)
 		@songs = user.songs
 	else
 		false 
 	end
 end


def user_songs(username)
 	  user = Username.find_by_username(username)
 	  songs = LastFm.api_call(user.username)
 	  songs.each do |song|
 		Song.create(title: song, username_id: user.id)
 	  end
    @songs = user.songs
 end
end







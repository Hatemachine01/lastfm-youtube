class Username < ApplicationRecord
include LastFm
has_many :songs


#validations
validates :username,  presence: true
validates_length_of :username, :minimum => 3, :maximum => 15
validates_uniqueness_of :username
validate :lastfm_username_exists


	def lastfm_username_exists
		#This validation is called last after the object has passed all other
		#validations. It checks if the username is valid
		return unless errors.blank?
		if LastFm.is_username_valid?(username) != true
			 errors.add(:username, "does not exist")
		end
	end




 	def returning_user(username)
 		#checks if username already exists on db. if it does it retrives the users songs
	 	if user = Username.find_by_username(username)
	 		@songs = user.songs
	 	else
	 		false 
	 	end
	 end


	def user_songs(username)
		#makes call to lastfm and saves users songs on db
	 	  user = Username.find_by_username(username)
	 	  songs = LastFm.api_call(user.username)
	 	  songs.each do |song|
	 		Song.create(title: song, username_id: user.id)
	 	  end
	    @songs = user.songs
	 end

end



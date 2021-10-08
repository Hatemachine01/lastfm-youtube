module LastFm
require 'json'
require 'open-uri'
	
	def self.api_call(username)
		#retrieves songs from lastfm
	    api_key = ENV['LASTFM_API']
	    url = "http://ws.audioscrobbler.com/2.0/?method=user.getlovedtracks&user=#{username}&api_key=#{'c7f41910c4ad62207cb1559aa3ba29e0'}&limit=500&format=json"
		open(url) do |f|
 	  		json_string = f.read
 	  		parsed_json = JSON.parse(json_string)
			songs = []
			 parsed_json["lovedtracks"]["track"].each {|track|
			 songs << track['name'] + '- ' +  track['artist']['name'] }
			 songs
 		end
	end




	def self.is_username_valid?(username)
		#checks if the username exists on the lastfm database
		api_key = ENV['LASTFM_API']
	    url = "http://ws.audioscrobbler.com/2.0/?method=user.getinfo&user=#{username}&api_key=#{'c7f41910c4ad62207cb1559aa3ba29e0'}&format=json"
		open(url) do |f|
 	  		json_string = f.read
 	  		parsed_json = JSON.parse(json_string)  
			profile_pic = parsed_json['user']   
			   if parsed_json['error'] == 6
 	  		 return false
 	  		else
 	  		 return  true 		
			end
		end
	end
end




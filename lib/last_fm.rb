module LastFm
require 'json'
require 'open-uri'
	def self.api_call(username)
	    api_key = ENV['LASTFM_API']
	    url = "http://ws.audioscrobbler.com/2.0/?method=user.getlovedtracks&user=#{username}&api_key=#{api_key}&limit=10&format=json"
		open(url) do |f|
 	  		json_string = f.read
 	  		parsed_json = JSON.parse(json_string)
 	  		songs = []
			 parsed_json["lovedtracks"]["track"].each {|track|
			 songs << track['name'] + '- ' +  track['artist']['name'] }
			 songs
 		end
	end
end
class Username < ApplicationRecord
require 'json'
require 'open-uri'
include ActiveModel::Validations
  
attr_accessor :username
validates :username,  presence: true


	def api_call(username)
	    api_key = ENV['LASTFM_API']
	    url = "http://ws.audioscrobbler.com/2.0/?method=user.getlovedtracks&user=#{username}&api_key=#{api_key}&limit=10&format=json"
		open(url) do |f|
 	  		json_string = f.read
 	  		parsed_json = JSON.parse(json_string)
			 parsed_json["lovedtracks"]["track"].each {|track|
			 p track['name'] + '- ' +  track['artist']['name'] }
 		end
	end
end



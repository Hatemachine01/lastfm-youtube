class Username < ApplicationRecord
require 'json'
require 'open-uri'
include ActiveModel::Validations
  
attr_accessor :username
validates :username,  presence: true


	def api_call(username)
	   
	    url = "http://ws.audioscrobbler.com/2.0/?method=user.getlovedtracks&user=#{username}&api_key=#{LASTFM_KEY_ID}&format=json"
		open(url) do |f|
 	  		json_string = f.read
 	  		parsed_json = JSON.parse(json_string)
 		end
	end
end



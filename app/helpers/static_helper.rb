module StaticHelper
require "uri"
require 'nokogiri'
require 'open-uri'
require "i18n"
require 'json'

	def video_id(song)
		#gets video id by scraping youtubes search result page
		song = sanitizer(song) #sanitizes song title to prevent encoding issues
		json =  open("http://youtube-scrape.herokuapp.com/api/search?q=""#{song}""&page=1").read
		data = JSON.parse(json)
		id = data['results'][1]['video']['id']	 
	end

	private 

	def sanitizer(song)
		#deletes accents and symbol from song title
		sanitized =  I18n.transliterate(song)
	end
end


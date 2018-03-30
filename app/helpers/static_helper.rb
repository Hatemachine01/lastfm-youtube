module StaticHelper
require "uri"
require 'nokogiri'
require 'open-uri'
require "i18n"

	def video_id(song)
		#gets video id by scraping youtubes search result page
		 song = sanitizer(song) #sanitizes song title to prevent encoding issues
		 url = 'https://www.youtube.com/results?search_query='+"#{song}"
		 doc = Nokogiri::HTML(open(url))
		 links = []
		 video_link = doc.css('a#video-title' '.yt-simple-endpoint style-scope ytd-video-renderer' , 'a').each do |fire|
		 links << fire['href']
		end
		 regex = /(?<=[?&]v=)[^&$]+/
		 links.each do |link|
		 match = link.match(regex)
			 if match 
			 	return  match[0]
			 else
			 	'nothing'
			end
		end
	end

	private 

	def sanitizer(song)
		#deletes accents and symbol from song title
		sanitized =  I18n.transliterate(song)
	end
end


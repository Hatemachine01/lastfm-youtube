module StaticHelper
require "uri"
require 'nokogiri'
require 'open-uri'
require "i18n"

	def video_id(song)
		 song = sanitizer(song)
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

	def object(songs)
		p "ENTRO" * 100
		songs.each do |song|
		return	song
		end
	end

	private 

	def sanitizer(song)
		sanitized =  I18n.transliterate(song)
	end
end


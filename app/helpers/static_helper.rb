module StaticHelper
require "uri"
require 'nokogiri'
require 'open-uri'

	def video_id
		doc = Nokogiri::HTML(open('https://www.youtube.com/results?search_query=DNA.-+Kendrick+Lamar'))
		 links = []
		 video_link = doc.css('a#video-title.yt-simple-endpoint style-scope ytd-video-renderer' , 'a').each do |fire|
		 links << fire['href']
		end
		 regex = /youtu(?:.*\/v\/|.*v\=|\.be\/)([A-Za-z0-9_\-]{11})/
		 links.each do |link|
		 p link
		 match = link.match(regex)
			 if match 
			 	return match[1]
			 else
			 	'nothing'
			end
		end
	end
end


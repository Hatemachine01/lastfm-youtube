module StaticHelper
require "uri"
require 'nokogiri'
require 'open-uri'

	def video_id(url)
		 doc = Nokogiri::HTML(open(url))
		 links = []
		 video_link = doc.css('a#video-title' '.yt-simple-endpoint style-scope ytd-video-renderer' , 'a').each do |fire|
		 links << fire['href']
		end
		 regex = /(?<=[?&]v=)[^&$]+/
		 links.each do |link|
		 match = link.match(regex)
			 if match 
			 	return 'https://www.youtube.com/watch?v=' + match[0]
			 else
			 	'nothing'
			end
		end
	end
end


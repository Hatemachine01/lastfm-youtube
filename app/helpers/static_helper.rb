module StaticHelper
require "uri"
	def video_id
		uri = URI.parse('https://www.youtube.com/results?search_query=DNA.-+Kendrick+Lamar')
	p	uri.inspect
	end
end

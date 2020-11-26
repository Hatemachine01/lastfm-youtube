module StaticHelper
require "uri"
require 'nokogiri'
require 'open-uri'
require "i18n"
require 'json'
require 'rspotify'


	def video_id(song)
		#gets video id by scraping youtubes search result page
		song = sanitizer(song) #sanitizes song title to prevent encoding issues
		json =  open("http://youtube-scrape.herokuapp.com/api/search?q=""#{song}""&page=1").read
		data = JSON.parse(json)
		id = data['results'][1]['video']['id']

	end


	def spotify_link(song)
		artists = RSpotify::Track.search("#{song}")
		spotify_link = artists.first.uri
	end

	def track_album(song)
		artists = RSpotify::Track.search("#{song}")
		spotify_link = artists.first
		spotify_link = artists.first.album.uri
	end

	def album_release_date(song)
		artists = RSpotify::Track.search("#{song}")
		spotify_link = artists.first
		spotify_link = artists.first.album.release_date
	end

	def album_name(song)
		artists = RSpotify::Track.search("#{song}")
		spotify_link = artists.first
		spotify_link = artists.first.album.name
	end

	def album_img(song)
		artists = RSpotify::Track.search("#{song}")
		spotify_link = artists.first
	p	spotify_link = artists.first.album.images[1]['url']
	end

	private 

	def sanitizer(song)
		#deletes accents and symbol from song title
		sanitized =  I18n.transliterate(song)
	end
end


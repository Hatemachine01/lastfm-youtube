module FakeLastfmCall
 Song = Struct.new(:song)
 @songs = []

 def self.api_call(song)
 	@songs  << Song.new(song)
 end

  def self.songs
 	@songs 
 end
end



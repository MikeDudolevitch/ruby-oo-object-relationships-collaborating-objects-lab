require 'pry'
class Artist
    attr_accessor :name
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end
    def self.all
        @@all
    end
    def add_song(song)
        song.artist = self
    end
    def songs
        Song.all.select {|song| song.artist == self}
    end
    def self.find_or_create_by_name(name)
        existing_artist = self.all.find do |artist|
            artist.name == name
        end
        if existing_artist
            existing_artist
        else
            new_artist = self.new(name)
            new_artist
        end
        # self.all.detect do |artist| 
        #  if artist.name == name
        #     return artist
        #  else
        #     self.new(name)
        #  end
        # end
    end
    def print_songs
        songs.each do |song|
            puts song.name
        end
    end
end
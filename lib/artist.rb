class Artist
    @@all = []

    def self.all
        @@all
    end

    attr_accessor :name

    def initialize(name)
        @name = name
        @@all << self
    end

    def songs
        Song.all.select{|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        found = @@all.find{|artist| artist.name == name}
        found ? found : Artist.new(name)
    end

    def print_songs
        songs.map{|song| song.name}.each{|song| puts song}
    end
end
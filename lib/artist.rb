class Artist
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        find_artist = Artist.all.select {|artist| artist.name == name}
        find_artist.size == 0 ? Artist.new(name) : find_artist[0]
    end

    def print_songs
        self.songs.each do |song|
            puts song.name
        end
    end
end
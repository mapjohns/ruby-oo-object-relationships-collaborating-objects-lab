require 'pry'
class MP3Importer
    attr_accessor :path
    def initialize(path)
        @path = path
    end

    def files
        # file[-4..-1] == ".mp3"
        Dir.each_child(@path).select {|file| file[-4..-1] == ".mp3"}
    end

    def import
        files.each do |file|
            Song.new_by_filename(file)
        end
    end
end
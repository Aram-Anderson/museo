require './lib/museum'
require './lib/artist'
require './lib/photograph'

class Curator

  attr_reader :artists,
              :museums,
              :photographs

  def initialize
    @artists = []
    @museums = []
    @photographs = []
    @museums = 0
  end

  def add_museum(arguments)
    @museums += 1
    museums << Museum.new(id: @museums, arguments)
  end

  def add_artist(arguments)
    artists << Artist.new(arguments)
  end

  def add_photograph(arguments)
    photographs << Photograph.new(arguments)
  end
end

require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/curator'

class CuratorTest < Minitest::Test

  def test_it_exists
    curator = Curator.new

    assert_instance_of Curator, curator
  end

  def test_it_initializes_with_artists
    curator = Curator.new

    assert_equal [], curator.artists
  end

  def test_it_initializes_with_museums
    curator = Curator.new

    assert_equal [], curator.museums
  end

  def test_it_initializes_with_photographs
    curator = Curator.new

    assert_equal [], curator.photographs
  end

  def test_it_can_add_museums
    # skip
    curator = Curator.new
    museum = Museum.new({id: 3, name: "MoMA"})

    assert_equal 0, curator.museums.count
    curator.add_museum({name: "MoMA"})

    assert_equal 1, curator.museums.count
  end
# > curator.museums
# # => [#<Museum:0x007f98a91a86e8 @id=1, @name="MoMA">]
#
# > curator.museums.count
# # => 1
#
# > curator.museums.first.id
# # => 1
  def test_it_can_add_artists
    curator = Curator.new

    assert_equal [], curator.artists

    curator.add_artist({id: 1, name: "Ansel Adams", born: 1902, died: 1984, country: "United States"})

    assert_equal 1, curator.artists.count
  end

  def test_its_artists_have_an_id
    curator = Curator.new

    curator.add_artist({id: 1, name: "Ansel Adams", born: 1902, died: 1984, country: "United States"})

    assert_equal 1, curator.artists.first.id
  end

  def test_it_can_add_photographs
    curator = Curator.new

    assert_equal 0, curator.photographs.count

    curator.add_photograph({id: 1, name: "Moonrise, Hernandez", artist_id: 1, museum_id: 1, year: 1941})

    assert_equal 1, curator.photographs.count
  end

  def test_photographs_have_an_id
    curator = Curator.new

    assert_nil curator.photographs.first

    curator.add_photograph({id: 1, name: "Moonrise, Hernandez", artist_id: 1, museum_id: 1, year: 1941})

    assert_equal 1, curator.photographs.first.id
  end
end

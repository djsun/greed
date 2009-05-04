require 'test_helper'

class AutoPlayerTest < Test::Unit::TestCase
  context 'An AutoPlayer' do
    should 'report available players' do
      assert_equal [Randy, Connie, Aggie], AutoPlayer.players
    end
  end
end

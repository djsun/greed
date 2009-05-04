require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  context 'A Player' do
    setup do
      @player = ComputerPlayer.new(:strategy => "Randy")
    end

    context 'with multiple turns' do
      setup do
        turns = (1..4).each do |n|
          @last_turn = Turn.new
          @player.turns << @last_turn
        end
      end

      should 'know its last turn' do
        assert_equal @last_turn, @player.turns.last
      end
    end
  end
end

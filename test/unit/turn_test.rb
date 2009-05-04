require 'test_helper'

class TurnTest < ActiveSupport::TestCase
  context 'A Turn' do
    setup do
      @turn = Turn.new
      @player = ComputerPlayer.new(:turns => [@turn])
      @player.save
    end

    should 'know its player' do
      assert_equal @player, @turn.player
    end

    context 'with several rolls' do
      setup do
        @r1 = Roll.new(:accumulated_score => 100)
        @r2 = Roll.new(:accumulated_score => 250)
        @turn.rolls = [@r1, @r2]
      end

      should 'know its rolls' do
        assert_equal [@r1, @r2], @turn.rolls
      end

      should 'have the accumulated score of the last roll' do
        assert_equal 250, @turn.score
      end
    end
  end
end

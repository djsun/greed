require 'test_helper'

class RollTest < ActiveSupport::TestCase
  context 'A Roll' do
    setup do
      @turn = Turn.new
      @roll = Roll.new(:turn => @turn, :accumulated_score => 300)
    end

    context 'with several faces' do
      setup do
        @faces = [
          Face.new(:value => 2),
          Face.new(:value => 3),
          Face.new(:value => 5),
          Face.new(:value => 5),
        ]
        @roll.faces = @faces
      end

      should 'know its turn' do
        assert_equal @turn, @roll.turn
      end

      should 'know its face values' do
        assert_equal [2, 3, 5, 5], @roll.face_values
      end

      should 'know its accumulated score' do
        assert_equal 300, @roll.accumulated_score
      end

      should 'know its points' do
        assert_equal 100, @roll.points
      end

      should 'know its unused die count' do
        assert_equal 2, @roll.unused
      end

      should 'not have an action' do
        assert_nil @roll.action
      end

      context 'when an action is added' do
        setup do
          @roll.action = :roll
        end
        should 'know its action' do
          assert_equal :roll, @roll.action
        end
      end
    end

    context "when saved" do
      setup do
        @roll.action = :hold
        @roll.save!
        @roll.reload
      end
      
      should 'return a symbol for action' do
        assert_equal :hold, @roll.action
      end
    end
  end
end

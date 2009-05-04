require 'test_helper'

class HumanPlayerTest < ActiveSupport::TestCase
  context 'A human player' do
    setup do
      @data = []
      @roller = Roller.new(SimulatedData.new(@data))
      @player = HumanPlayer.new
      @player.roller = @roller
    end

    context 'when taking a turn' do
      setup do
        @player.start_turn
      end
      
      should 'add a turn' do
        assert_equal 1, @player.turns.size
      end

      context 'and rolling the dice' do
        setup do
          @data << [1,2,3,4,5]
          @player.roll_dice
        end

        should 'have one roll on the last turn' do
          assert_equal 1, @player.turns.last.rolls.size
        end

        should 'have a turn score matching the roll' do
          assert_equal 150, @player.turns.last.score
        end

        context 'and holding' do
          setup do
            @player.holds
          end
          should 'have the turn score added to the total score' do
            assert_equal 150, @player.score
          end
        end

        context 'and rolls again going bust' do
          setup do
            @data << [2,2,3,3,4]
            @player.rolls_again
          end

          should 'have 2 rolls' do
            assert_equal 2, @player.turns.last.rolls.size
          end

          should 'be bust' do
            assert_equal :bust, @player.turns.last.rolls.last.action
          end
        end

        context 'and rolls again scoring points' do
          setup do
            @data << [1,1,1,1,1]
            @player.rolls_again
          end

          should 'have 2 rolls' do
            assert_equal 2, @player.turns.last.rolls.size
          end

          should 'have the first roll have the roll action' do
            assert_equal :roll, @player.turns.last.rolls[0].action
          end

          should 'have the second roll with only unused dice' do
            assert_equal 3, @player.turns.last.rolls.last.face_values.size
          end

          should 'have the accumulated score' do
            assert_equal 1150, @player.turns.last.rolls.last.accumulated_score
          end

          context 'and rolls yet again' do
            setup do
              @data << [1,2,3,4,5]
              @player.rolls_again
            end
            should 'roll all 5 dice' do
              assert_equal 5, @player.turns.last.rolls.last.face_values.size
            end
          end
        end
      end
    end
  end
end

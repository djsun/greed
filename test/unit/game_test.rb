require 'test_helper'

class GameTest < ActiveSupport::TestCase
  context 'A game' do
    setup do
      @game = Game.new
      @cp = ComputerPlayer.new
      @hp = HumanPlayer.new
      @game.computer_players = [@cp]
      @game.human_player = @hp
    end
    should 'combine its computer players and human player' do
      assert_equal [@cp, @hp], @game.players
    end

    context 'when saved' do
      setup do
        @faces = (1..5).map { |i| Face.new(:value => i) }
        @roll = Roll.new(:faces => @faces)
        @turn = Turn.new(:rolls => [@roll])
        @player = ComputerPlayer.new(:turns => [@turn])
        @game = Game.new(:computer_players => [@player])
        
        @game.save
      end

      should 'save all the elements' do
        assert ! @game.new_record?
        assert ! @player.new_record?
        assert ! @turn.new_record?
        assert ! @roll.new_record?
        @faces.each do |f|
          assert ! f.new_record?, "Face #{f.value} should now be new"
        end
      end
    end
  end
end

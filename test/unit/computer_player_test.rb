require 'test_helper'

class ComputerPlayerTest < ActiveSupport::TestCase
  context 'A Computer Player' do
    setup do
      @player = ComputerPlayer.new(:strategy => "Randy")
    end

    should 'create their strategy' do
      assert_instance_of Randy, @player.logic
    end

    should 'have an initial score of zero' do
      assert_equal 0, @player.score
    end

    context 'with a strategy' do
      setup do
        @strategy = flexmock("Strategy")
        @player.instance_variable_set("@logic", @strategy)
      end

      should 'delegate name to strategy' do
        @strategy.should_receive(:name).once
        @player.name
      end

      should 'delegate description to strategy' do
        @strategy.should_receive(:description).once
        @player.description
      end

      should 'delegate roll_again to strategy' do
        @strategy.should_receive(:roll_again?).once
        @player.roll_again?
      end
    end

  end

  context 'A Computer Player' do
    setup do
      @game = Game.new
      @player = ComputerPlayer.new(:game => @game)
      @player.logic = @strategy
    end
    
    context 'where the player goes bust on first roll' do
      setup do
        flexmock(@player.roller).should_receive(:random_faces).with(5).
          once.and_return([4,2,2,3,3])
        flexmock(@player).should_receive(:roll_again?).never
      end
      
      should "zero points" do
        turn = @player.take_turn
        roll = turn.rolls.first
        assert_equal :bust, roll.action
        assert_equal [4,2,2,3,3], roll.face_values
        assert_equal 0, roll.points
        assert_equal 5, roll.unused
      end
    end
    
    context 'where the player holds on first roll' do
      setup do
        flexmock(@player.roller).should_receive(:random_faces).with(5).
          once.and_return([1,2,2,3,3])
        flexmock(@player).should_receive(:roll_again?).once.
          and_return(false)
      end
      
      should "get the points of the roll" do
        turn = @player.take_turn
        roll = turn.rolls.first
        assert_equal [1,2,2,3,3], roll.face_values
        assert_equal 100, roll.points
        assert_equal 4, roll.unused
        assert_equal 100, turn.score
      end
    end
    
    context 'where the player rolls again scoring all the dice' do
      setup do
        flexmock(@player.roller).should_receive(:random_faces).with(5).
          once.and_return([1,1,1,1,1])
        flexmock(@player).should_receive(:roll_again?).once.
          and_return(true)
        flexmock(@player.roller).should_receive(:random_faces).with(5).
          once.and_return([2,2,3,3,4])
      end

      should 'should roll all five dice again' do
        turn = @player.take_turn
      end
    end

    context 'where the player rolls again' do
      setup do
        flexmock(@player.roller).should_receive(:random_faces).with(5).
          once.and_return([1,2,2,3,3])
        flexmock(@player).should_receive(:roll_again?).once.
          and_return(true)
      end
      
      context 'and then holds' do
        setup do
          flexmock(@player.roller).should_receive(:random_faces).with(4).
            once.and_return([5,2,3,3])
          flexmock(@player).should_receive(:roll_again?).once.
            and_return(false)
        end
        
        should 'get the total points of the turn' do
          turn = @player.take_turn
          assert_equal 150, turn.score
        end
      end
      
      context 'and goes bust' do
        setup do
          flexmock(@player.roller).should_receive(:random_faces).with(4).
            once.and_return([4,2,3,3])
          flexmock(@player).should_receive(:roll_again?).never
        end
        
        should 'get zero points for that turn' do
          turn = @player.take_turn
          assert_equal 0, turn.score
        end
      end
    end
  end
end

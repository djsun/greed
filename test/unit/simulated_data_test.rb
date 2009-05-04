require 'test_helper'

class SimulatedDataTest < Test::Unit::TestCase
  context 'An simulated roller' do
    setup do
      @sim_data = []
      @data_source = SimulatedData.new(@sim_data)
    end

    context 'with no data' do
      should 'roll nil' do
        assert_nil @data_source.random_numbers(4)
      end
    end

    context 'with data' do
      setup do
        @expected_data = [[1,1,1,1,1], [2,2,2,2,2], [3,3,3,3,3]]
        @expected_data.each do |roll| @sim_data.push(roll) end
      end

      should 'return the rolls in orderr' do
        result = (1..3).map { |i|
          @data_source.random_numbers(5)
        }
        assert_equal @expected_data, result
      end

      should 'honor the requested number of dice' do
        assert_equal [1,1], @data_source.random_numbers(2)
      end

      context 'when out of data' do
        setup do
          3.times do @data_source.random_numbers(5) end
        end
        should 'roll a nil' do
          assert_nil @data_source.random_numbers(5)
        end
      end

    end

  end
end

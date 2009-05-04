require 'test_helper'

class PriorityDataSourceTest < Test::Unit::TestCase
  context 'A priority data source' do
    setup do
      @data1 = []
      @data2 = []
      @s1 = SimulatedData.new(@data1)
      @s2 = SimulatedData.new(@data2)
      @source = PriorityDataSource.new(@s1, @s2)
    end

    context 'with no data' do
      should 'return nil' do
        assert_nil @source.random_numbers(5)
      end
    end

    context 'with data in the first source' do
      setup do
        @data1 << [1,1,1,1,1]
      end
      should 'return data from the first source' do
        assert_equal [1,1,1,1,1], @source.random_numbers(5)
      end
    end

    context 'with data in the second source' do
      setup do
        @data2 << [2,2,2,2,2]
      end
      should 'return data from the second source' do
        assert_equal [2,2,2,2,2], @source.random_numbers(5)
      end
    end

    context 'with data both sources' do
      setup do
        @data1 << [1,1,1,1,1]
        @data2 << [2,2,2,2,2]
      end
      should 'return data from the second source' do
        assert_equal [1,1,1,1,1], @source.random_numbers(5)
      end
    end
  end
end

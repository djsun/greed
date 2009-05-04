require 'test_helper'

class FaceTest < ActiveSupport::TestCase
  context 'A Face' do
    setup do
      @roll = Roll.new
      @face = Face.new(:value => 3, :roll => @roll)
    end

    should 'know what roll it belongs to' do
      assert_equal @roll, @face.roll
    end

    should 'report its face value' do
      assert_equal 3, @face.value
    end
  end
end

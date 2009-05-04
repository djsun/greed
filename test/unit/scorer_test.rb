require 'test_helper'

class ScorerTest < Test::Unit::TestCase
  def setup
    @scorer = Scorer.new
  end

  def score(roll)
    @scorer.score(roll)
    @scorer.points
  end

  def unused(roll)
    @scorer.score(roll)
    @scorer.unused
  end

  def test_empty_roll_is_worth_zero_points
    assert_equal 0, score([])
  end

  def test_fives_are_worth_50_points_each
    assert_equal 50, score([5])
    assert_equal 100, score([5, 5])
  end

  def test_ones_are_worth_100_points_each
    assert_equal 100, score([1])
    assert_equal 200, score([1, 1])
  end

  def test_triples_are_worth_100_times_the_face_value
    assert_equal 200, score([2, 2, 2])
    assert_equal 300, score([3, 3, 3])
    assert_equal 400, score([4, 4, 4])
    assert_equal 500, score([5, 5, 5])
    assert_equal 600, score([6, 6, 6])
  end

  def test_triples_of_ones_are_worth_1000_points
    assert_equal 1000, score([1, 1, 1])
  end

  def test_mixed_rolls
    assert_equal 0, score([2,3,4,4,6])
    assert_equal 450, score([3, 5, 1, 3, 3])
  end

  def test_unused_dice
    assert_equal 0, unused([])
    assert_equal 0, unused([2,2,2,1,5])
    assert_equal 4, unused([2,3,4,6])
    assert_equal 1, unused([1,2])
  end
end

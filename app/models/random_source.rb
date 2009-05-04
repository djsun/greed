class RandomSource
  def random_numbers(n)
    (1..n).map { rand(6) + 1 }
  end
end

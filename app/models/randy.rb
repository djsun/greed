class Randy < GameStrategy
  def name
    "Randy"
  end

  def description
    "Random Player"
  end

  def roll_again?
    rand(2) == 0
  end
end

class HumanPlayer < Player
  validates_length_of :name, :within => 1..32

  def description
    "Human"
  end

  def start_turn
    turn = Turn.new
    turns << turn
  end

  def roll_dice(dice_count=5)
    roller.roll(dice_count)
    accumulated_score = roller.points
    accumulated_score += turns.last.rolls.last.accumulated_score unless turns.last.rolls.empty?
    roll = Roll.new(
      :faces => roller.faces.map { |n| Face.new(:value => n) },
      :score => roller.points,
      :unused => roller.unused,
      :accumulated_score => accumulated_score)
    turns.last.rolls << roll
    if roller.points == 0
      turns.last.rolls.last.action = :bust
    end
  end

  def holds
    self.score += turns.last.score
  end

  def rolls_again
    turns.last.rolls.last.action = :roll
    roll_dice(number_of_dice_to_roll)
  end

  private

  def number_of_dice_to_roll
    count = turns.last.rolls.last.unused
    (count == 0) ? 5 : count
  end
end

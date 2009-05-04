class ComputerPlayer < Player

  delegate :name, :description, :roll_again?, :to => :logic
  attr_writer :logic

  def logic
    @logic ||= make_strategy
  end

  def do_roll(roller, turn_score, action)
    Roll.new(
      :faces             => roller.faces.map { |n| Face.new(:value => n) },
      :score             => roller.points,
      :unused            => roller.unused,
      :accumulated_score => turn_score,
      :action            => action)
  end

  def take_turn
    history = []
    turn_score = 0
    roller.roll(5)
    loop do
      if roller.points == 0
        turn_score = 0
        history << do_roll(roller, turn_score, :bust)
        break
      end
      turn_score += roller.points
      if ! roll_again?
        history << do_roll(roller, turn_score, :hold)
        break
      end
      history << do_roll(roller, turn_score, :roll)
      dice_count = (roller.unused == 0) ? 5 : roller.unused
      roller.roll(dice_count)
    end
    turns << Turn.new(:rolls => history)
    save
    turns.last
  end
  
  private

  def make_strategy
    strategy.constantize.new
  end
end

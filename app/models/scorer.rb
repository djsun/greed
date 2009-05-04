class Scorer
  attr_reader :points, :unused

  def score(roll)
    @unused = 0
    @points = 0
    (1..6).each do |face|
      face_score(roll, face)
    end
  end

  private
  
  def face_score(roll, face)
    count = roll.select { |n| n == face }.size
    if count >= 3
      if face == 1
        @points += 1000
      else
        @points += 100 * face
      end
      count -= 3
    end
    if face == 5
      @points += 50 * count
    elsif face == 1
      @points += 100 * count
    else
      @unused += count
    end
  end
end

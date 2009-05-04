class Roller
  attr_reader :faces
  
  def initialize(source=RandomSource.new)
    @source = source
    @faces = []
    @scorer = Scorer.new
  end
  
  def roll(n)
    @faces = random_faces(n)
    @scorer.score(@faces)
  end
  
  def points
    @scorer.points
  end
  
  def unused
    @scorer.unused
  end
  
  private

  def random_faces(n)
    @source.random_numbers(n)
  end
end

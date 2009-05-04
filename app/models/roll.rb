class Roll < ActiveRecord::Base
  has_many :faces
  belongs_to :turn
  acts_as_list :scope => :turn

  def face_values
    faces.map { |f| f.value }
  end

  def points
    update_points unless defined?(@points)
    @points
  end

  def unused
    update_points unless defined?(@unused)
    @unused
  end

  def action
    action_name ? action_name.to_sym : nil
  end

  def action=(act)
    self.action_name = act.to_s
    save!
  end

  private

  def update_points
    scorer = Scorer.new
    scorer.score(face_values)
    @points = scorer.points
    @unused = scorer.unused
  end

end

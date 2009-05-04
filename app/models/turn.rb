class Turn < ActiveRecord::Base
  has_many :rolls
  belongs_to :player
  acts_as_list :scope => :player

  def score
    rolls.last.accumulated_score
  end
end

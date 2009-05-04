class Player < ActiveRecord::Base
  belongs_to :game
  has_many :turns

  attr_writer :roller

  def roller
    @roller ||= Roller.new
  end
end

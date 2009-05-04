class Face < ActiveRecord::Base
  belongs_to :roll
  acts_as_list :scope => :roll
end

class Availability < ActiveRecord::Base
  attr_accessible :user_id, :time_start, :time_end

  belongs_to :user

  validates_uniqueness_of :user_id, :scope => [:time_end, :time_start]
end

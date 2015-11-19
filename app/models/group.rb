class Group < ActiveRecord::Base
  validates_presence_of :name

  default_scope { order(:order) }
end

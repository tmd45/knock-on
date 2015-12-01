class Group < ActiveRecord::Base
  has_many :members

  validates_presence_of :name

  default_scope { order(:order) }
end

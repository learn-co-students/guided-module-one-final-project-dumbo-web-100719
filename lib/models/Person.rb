class Person < ActiveRecord::Base
  has_many :feelings, through: :events
end

class User < ActiveRecord::Base
  has_many :feelings, through: :events
end

class User < ActiveRecord::Base
  has_many :feelings
  has_many :events , through: :feelings
end

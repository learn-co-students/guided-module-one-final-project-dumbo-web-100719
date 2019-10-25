class Event < ActiveRecord::Base
    has_many :feelings
    has_many :users, through: :feelings
end


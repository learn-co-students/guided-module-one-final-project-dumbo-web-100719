class Feeling < ActiveRecord::Base
    belongs_to :person
    has_many :events
end
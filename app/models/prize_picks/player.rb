module PrizePicks
  class Player < ApplicationRecord
    has_many :projections
  end
end

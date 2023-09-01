# frozen_string_literal: true

class Waitlist < ApplicationRecord
  validates :email, presence: true, uniqueness: true
end

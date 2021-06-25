class Whiskey < ApplicationRecord
  validates :name, :age, :country, :notes, presence: true
end

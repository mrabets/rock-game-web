class Room < ApplicationRecord
  has_many :moves

  validates :name, presence: true
  validates :name, name: true
end
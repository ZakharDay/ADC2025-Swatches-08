class Swatch < ApplicationRecord
  has_many :fills
  belongs_to :project
  validates :name, presence: true
end

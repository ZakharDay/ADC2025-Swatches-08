class Project < ApplicationRecord
  has_many :swatches
  validates :name, presence: true
end

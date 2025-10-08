class Project < ApplicationRecord
  has_many :swatches
  belongs_to :user
  validates :name, presence: true
end

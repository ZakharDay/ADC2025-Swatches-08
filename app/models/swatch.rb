class Swatch < ApplicationRecord
  belongs_to :user
  belongs_to :project, optional: true

  has_many :swatches_fills, class_name: "SwatchesFills"
  has_many :fills, through: :swatches_fills

  has_many :forks, class_name: "Swatch", foreign_key: "origin_id"
  belongs_to :origin, class_name: "Swatch", optional: true

  has_many :comments, as: :commentable

  validates :name, presence: true
end

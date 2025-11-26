class Fill < ApplicationRecord
  belongs_to :user

  has_many :swatches_fills, class_name: "SwatchesFills"
  has_many :swatches, through: :swatches_fills

  has_many :fills_colors, class_name: "FillsColors"
  has_many :colors, through: :fills_colors

  has_many :forks, class_name: "Fill", foreign_key: "origin_id"
  belongs_to :origin, class_name: "Fill", optional: true

  has_many :comments, as: :commentable

  validates :name, presence: true
end

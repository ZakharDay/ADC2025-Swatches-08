class Fill < ApplicationRecord
  belongs_to :user

  has_many :swatch_fills
  has_many :swatches, through: :swatch_fills

  has_many :fill_colors
  has_many :colors, through: :fill_colors

  has_many :forks, class_name: "Fill", foreign_key: "origin_id"
  belongs_to :origin, class_name: "Fill", optional: true

  has_many :comments, as: :commentable

  validates :name, presence: true
end

class Color < ApplicationRecord
  has_many :fills_colors, class_name: "FillsColors"
  has_many :fills, through: :fills_colors
end

class Color < ApplicationRecord
  has_many :fills
  has_many :swatches, through: :fills

  # belongs_to :fill
  # belongs_to :user

  # def as_json
  #   {
  #     color: color,
  #     alpha: alpha,
  #     stop: stop
  #   }
  # end
end

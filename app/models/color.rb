class Color < ApplicationRecord
  belongs_to :fill
  belongs_to :user

  # def as_json
  #   {
  #     color: color,
  #     alpha: alpha,
  #     stop: stop
  #   }
  # end
end

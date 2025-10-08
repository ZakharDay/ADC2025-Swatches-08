class Color < ApplicationRecord
  belongs_to :fill
  belongs_to :user
end

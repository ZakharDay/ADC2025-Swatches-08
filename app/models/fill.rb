class Fill < ApplicationRecord
  has_many :colors
  belongs_to :swatch
  belongs_to :user
  validates :name, presence: true

  # def as_json
  #   {
  #     name: name,
  #     colors: colors
  #   }
  # end
end

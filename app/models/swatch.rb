class Swatch < ApplicationRecord
  belongs_to :user
  belongs_to :project, optional: true

  has_many :fills
  has_many :colors, through: :fills

  has_many :forks, class_name: "Swatch", foreign_key: "origin_id"
  belongs_to :origin, class_name: "Swatch", optional: true

  validates :name, presence: true

  # def as_json
  #   {
  #     name: name,
  #     fills: fills
  #   }
  # end
end

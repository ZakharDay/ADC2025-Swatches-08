class Fill < ApplicationRecord
  belongs_to :user
  
  belongs_to :swatch
  belongs_to :color

  has_many :forks, class_name: "Swatch", foreign_key: "origin_id"
  belongs_to :origin, class_name: "Swatch", optional: true

  validates :name, presence: true

  # def as_json
  #   {
  #     name: name,
  #     colors: colors
  #   }
  # end
end

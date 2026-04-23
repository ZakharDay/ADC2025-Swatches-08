class Swatch < ApplicationRecord
  belongs_to :user
  belongs_to :project, optional: true

  has_many :swatch_fills
  has_many :fills, through: :swatch_fills

  has_many :forks, class_name: "Swatch", foreign_key: "origin_id"
  belongs_to :origin, class_name: "Swatch", optional: true

  has_many :comments, as: :commentable

  validates :name, presence: true

  # after_create_commit {
  #   broadcast_append_to(
  #     "promo_swatch_rail",
  #     target: "W_PromoSwatchRail",
  #     partial: "components/O_PromoSwatch",
  #     locals: { swatch: self }
  #   )
  # }

end

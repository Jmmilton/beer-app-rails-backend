class Beer < ApplicationRecord
  has_one_attached :image


  scope :brewed, -> { where(beer_type: "brewed") }
  scope :tasted, -> { where(beer_type: "tasted") }
end

 
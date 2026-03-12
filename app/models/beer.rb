class Beer < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  scope :brewed, -> { where(beer_type: "brewed") }
  scope :tasted, -> { where(beer_type: "tasted") }

  def as_json(options = {})
    super.merge(
      image_url: image.attached? ? Rails.application.routes.url_helpers.url_for(image) : nil
    )
  end

  def beer_image
    if image.attached?
      image.variant(
        convert: 'jpg',
        resize_to_limit: [1200, 1200],
        saver: { quality: 85 }
      ).processed.url
    end
  end

end

 
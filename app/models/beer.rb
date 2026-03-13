class Beer < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  scope :brewed, -> { where(beer_type: "brewed") }
  scope :tasted, -> { where(beer_type: "tasted") }

  def as_json(options = {})
    super.merge(
      beer_image: image.attached? ? beer_image : nil
    )
  end

  def beer_image
    return nil unless image.attached?
    blob = image.blob
    "https://#{ENV['SUPABASE_PROJECT_REF']}.supabase.co/storage/v1/object/public/#{ENV['SUPABASE_BUCKET']}/#{blob.key}"
  rescue StandardError => e
    Rails.logger.error "Image URL failed: #{e.message}"
    nil
  end
end

 
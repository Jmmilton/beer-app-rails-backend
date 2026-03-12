# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf

# Register HEIC/HEIF as variable (transformable) content types for ActiveStorage.
# ActiveStorage 6.1 does not include these by default, so .variant() calls
# raise ActiveStorage::InvariableError without this.
Rails.application.config.after_initialize do
  ActiveStorage.variable_content_types << "image/heic"  unless ActiveStorage.variable_content_types.include?("image/heic")
  ActiveStorage.variable_content_types << "image/heif"  unless ActiveStorage.variable_content_types.include?("image/heif")
end

class CustomDeviseMailer < Devise::Mailer
  def reset_password_instructions(record, token, opts = {})
    @token = token
    @resource = record
    @url = "#{ENV['FRONTEND_URL']}/reset-password?reset_password_token=#{token}"
    super
  end
end
class CustomDeviseMailer < Devise::Mailer
  def reset_password_instructions(record, token, opts = {})
    @token = token
    @resource = record
    @url = "#{ENV['FRONTEND_URL']}/#/reset-password?reset_password_token=#{token}"
    mail(
      to: record.email,
      from: Devise.mailer_sender,
      subject: "Reset your password",
      template_path: 'devise/mailer',
      template_name: 'reset_password_instructions'
    )
  end
end
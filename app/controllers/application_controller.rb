class ApplicationController < ActionController::Base

  def csrf_token
    render plain: form_authenticity_token
  end

end

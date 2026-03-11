class ApplicationController < ActionController::API
  before_action :check_demo_user, only: [:create, :update, :destroy], 
  unless: -> { controller_name == 'sessions' || controller_name == 'passwords' }

  private

  def check_demo_user
    if current_user&.demo?
      render json: { error: "Demo account cannot make changes" }, status: :forbidden
    end
  end
end
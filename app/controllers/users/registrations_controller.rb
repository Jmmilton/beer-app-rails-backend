class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    super do |resource|
      if resource.persisted?
        sign_in(resource)
      end
    end
  rescue ActiveRecord::RecordNotUnique
    render json: { error: "An account with this email already exists" }, status: :unprocessable_entity
  end

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: { user: resource }, status: :created
    else
      render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
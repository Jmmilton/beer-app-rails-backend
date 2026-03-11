class BeersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @beers = current_user.beers

    render json: {
      beers: @beers,
      total: @beers.count,
      brewed_count: current_user.beers.brewed.count,
      tasted_count: current_user.beers.tasted.count
    }
  end

  def all
    render json: current_user.beers
  end

  def brewed
    render json: current_user.beers.brewed
  end

  def tasted
    render json: current_user.beers.tasted
  end

  def create
    beer = current_user.beers.new(beer_params)

    if params[:beer][:beer_image].present?
      beer.image.attach(params[:beer][:beer_image])
    end
    
    if beer.save
      render json: beer, status: :created
    else
      render json: { errors: beer.errors.full_messages }, 
             status: :unprocessable_entity
    end
  end

  def show
    @beer = current_user.beers.find(params[:id])
    render json: { beer: @beer }
  end

  def destroy
    @beer = current_user.beers.find(params[:id])
    @beer.destroy
    render json: {}, status: :no_content
  end

  private

  # def beer_class
  #   case params[:variant]
  #   when "homebrew"
  #     Beer.brewed
  #   when "tasted"
  #     Beer.tasted
  #   else
  #     raise ActionController::BadRequest, "Invalid beer variant"
  #   end
  # end

  def beer_params
    common = [
      :name,
      :description,
      :style,
      :abv,
      :rating,
      :favourite,
      :beer_type
    ]

    variant_specific =
      case params[:variant]
      when "homebrew"
        [:brewing_notes, :date_brewed]
      when "tasted"
        [:tasted_notes, :location, :date_tasted]
      else
        []
      end

    params.require(:beer).permit(common + variant_specific)
  end

end


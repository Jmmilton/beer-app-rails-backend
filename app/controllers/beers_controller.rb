class BeersController < ApplicationController
  
  def index
    @beers = Beer.all

    render json: {
      beers: @beers,
      total: @beers.count,
      brewed_count: Beer.brewed.count,
      tasted_count: Beer.tasted.count
    }
  end

  def all
    render json: Beer.all
  end

  def brewed
    render json: Beer.brewed
  end

  def tasted
    render json: Beer.tasted
  end

  def create
    beer = beer_class.new(beer_params)

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
    @beers = Beer.find(params[:id])
    render json: {
      beers: @beers
    }
  end

  def destroy
    @beers = Beer.find(params[:id])
    @beers.destroy
  end

  private

  def beer_class
    case params[:variant]
    when "homebrew"
      Beer.brewed
    when "tasted"
      Beer.tasted
    else
      raise ActionController::BadRequest, "Invalid beer variant"
    end
  end

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


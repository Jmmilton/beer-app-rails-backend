class BeersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  
  def index
    brewed = BrewedBeer.all.map { |b| b.as_json.merge(source: "brewed") }

    tasted = TastedBeer.all.map { |b| b.as_json.merge(source: "tasted") }

    beers = brewed + tasted

    beers.sort_by! { |b| b["created_at"] }.reverse!

    render json: beers
  end

  def create
    beer = beer_class.new(beer_params)
    
    if beer.save
      render json: beer, status: :created
    else
      render json: { errors: beer.errors.full_messages }, 
             status: :unprocessable_entity
    end
  end

  private

  def beer_class
    case params[:variant]
    when "homebrew"
      BrewedBeer
    when "tasted"
      TastedBeer
    else
      raise ActionController::BadRequest, "Invalid beer variant"
    end
  end

  def beer_params
    common = [
      :title,
      :description,
      :style,
      :abv,
      :rating,
      :beer_image,
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

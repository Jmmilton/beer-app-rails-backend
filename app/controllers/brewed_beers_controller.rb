class BrewedBeersController < ApplicationController

  def show
    @brewed_beer = BrewedBeer.find(params[:id])
  end

  def index

    render json: BrewedBeer.all
  end

end
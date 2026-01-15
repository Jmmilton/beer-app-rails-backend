class TastedBeersController < ApplicationController

  def show
    @tasted_beer = TastedBeer.find(params[:id])
  end

  def index

    render json: TastedBeer.all
  end
end

class API::PokemonController < ApplicationController
  def index
    sleep 0.5
    @pokemon = Pokemon.all
  end

  def show
    sleep 0.5
    @pokemon = Pokemon.find(params[:id])
  end
end
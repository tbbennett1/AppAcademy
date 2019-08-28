class Api::PokemonController < ApplicationController

   def show
      @pokemon = Pokemon.find_by(id: params[:id])
      render :show
   end

   def index
      @pokemon = Pokemon.all  
      render :index
   end

end


class PetsController < ApplicationController
  skip_before_action :authenticate_user!, :pet_params, only: %i[index show]
  def new
  end

  def index
    @pets = Pet.all
  end

  def show
    @oet = Pet.find(params[:id])
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :description, :photo)
  end
end

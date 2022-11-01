class PetsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_pet, only: %i[show]

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    # @pet.user_id = current_user.id
    @pet.user = current_user
    @pet.save
    redirect_to pets_path
  end

  def index
    @pets = Pet.all
    # only Pets with coordinates
    @markers = @pets.geocoded.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude,
        info_window: render_to_string(partial: "shared/info_window", locals: { pet: pet}),
        image_url: helpers.asset_url("paw-solid.png")

      }
    end
  end

  def show
    @pet = Pet.find(params[:id])
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :description, :city, :species, :age, :category, :photo, :address)
  end
end

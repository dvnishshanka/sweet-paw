class PetsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_pet, only: %i[show]

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user # @pet.user_id = current_user.id
    @pet.save
    redirect_to pets_path
  end

  def index
    if params[:query].present?
      @pets = Pet.global_search(params[:query])
    else
      @pets = Pet.all
    end
    # only Pets with coordinates
    @markers = @pets.geocoded.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude,
        info_window: render_to_string(partial: "shared/info_window", locals: { pet: pet}),
        image_url: helpers.asset_url("green-paw.png")
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

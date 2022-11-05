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
    @pets = Pet.global_search(params[:query]) if params[:query].present?
    @specific_pet = params[:species]
    @specific_city = params[:city]
    @less_than_price = params[:price].to_i


    # if (@specific_pet == "" || @specific_pet.nil?) && (@specific_city == "" || @specific_city.nil?) && (@less_than_price == "" || @less_than_price.nil?)
      @pets = Pet.all
    # else
    #   raise
    #   @pets = Pet.where(species: @specific_pet).where(city: @specific_city).where("price < ?", @less_than_price)
    # end
  end

  def show
    @pet = Pet.find(params[:id])
    @review = Review.new
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :description, :city, :species, :age, :category, :photo, :address, :price)
  end
end

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

    elsif params[:city].present?
      if params[:species] == "All" || params[:species] == ""
        sql_query = <<~SQL
          pets.address ILIKE :city
          OR pets.city ILIKE :city
        SQL
      else
        sql_query = <<~SQL
          pets.species ILIKE :species
          AND pets.address ILIKE :city
          OR pets.city ILIKE :city
        SQL
      end
       @pets = Pet.where(sql_query, species: "%#{params[:species]}%", city: "%#{params[:city]}%")
    else
      @pets = Pet.all
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
    params.require(:pet).permit(:name, :description, :city, :species, :age, :category, :photo, :address, :price)
  end
end

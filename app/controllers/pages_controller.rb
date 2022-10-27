class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @pets = Pet.all.sample(3)
  end

  def dashboard
    @user= current_user
    current_user_pets
  end

  private

  def current_user_pets
    @my_pets = Pet.where(species: 'dog').all
  end

end

class PetsController < ApplicationController
  def new
  end

  def index
    @pets = Pet.all
  end
end

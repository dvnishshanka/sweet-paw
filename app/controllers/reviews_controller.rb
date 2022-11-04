class ReviewsController < ApplicationController
  def create
    @pet = Pet.find(params[:pet_id])
    @review = Review.new(review_params)
    @review.pet = @pet
    respond_to do |format|
      if @review.save
        format.html { redirect_to pet_path(@pet) }
        format.json # Follow the classic Rails flow and look for a create.json view
      else
        format.html { render "pets/show", status: :unprocessable_entity }
        format.json # Follow the classic Rails flow and look for a create.json view
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end

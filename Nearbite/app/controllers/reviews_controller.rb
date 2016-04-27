class reviewsController < ApplicationController
  before_action :find_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @review = review.all.order("created_at DESC")
  end

  def show

  end

  def new
    @review = current_user.reviews.build
  end

  def create
    @review = current_user.reviews.build(review_params)

    if @review.save
      redirect_to @review, notice: "Successfully created new review"
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @review.update(review_params)
      redirect_to @review
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy

    redirect_to root_path, notice: "Successfully deleted review"
  end

  private

    def review_params
      params.require(:review).permit(:title, :description, :image, ingredients_attributes: [:id, :name, :_destroy], directions_attributes: [:id, :step, :_destroy])
    end

    def find_review
      @review = review.find(params[:id])
    end

end

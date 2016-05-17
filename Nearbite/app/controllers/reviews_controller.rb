class ReviewsController < ApplicationController
  before_action :find_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @reviews = current_user.reviews
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
    @review.build_business
  end

  def create
    @review = current_user.reviews.build(review_params)
    @review.business_id = params[:set_bus_id]

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
      params.require(:review).permit(:title, :description, :image, :business_id)
    end

    def find_review
      @review = Review.find(params[:id])
    end
end
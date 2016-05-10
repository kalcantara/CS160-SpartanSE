class ReviewsController < ApplicationController
  before_action :find_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @review = Review.all.order("created_at DESC")
    @business = Business.find(params[:id])

  end

  def show
    # @business = Business.find(params[:id])
    # @review = @business.reviews
    @review = Review.find(params[:id])
  end

  def new
    # @review = current_user.reviews.build
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
      params.require(:review).permit(:title, :description, :image).merge(:user_id => current_user.id, :business_id => params[:business_id])
    end

    def find_review
      @review = Review.find(params[:id])
    end
end
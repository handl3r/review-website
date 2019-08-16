class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
    @user = current_user
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    review_params.merge!(user_id: current_user.id)
    @review = Review.new(review_params)
    hash_value = review_params.merge(type: 1)
    @place = Place.find_by(id: hash_value[:place_id])
    respond_to do |format|
      if  @place.increase_rating(hash_value) && @review.save
        @place.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    hash_value = {type: 2, review_id: @review.id, rating: review_params_update[:rating],
                  place_id: @review.place.id}
    @place = Place.find_by(id: hash_value[:place_id])
    respond_to do |format|
      if @place.increase_rating(hash_value) && @review.update(review_params_update)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def review_params
    # params.fetch(:review, {})
    params.require(:review).permit(:place_id, :rating, :comment)
  end

  def review_params_update
    params.require(:review).permit(:rating, :comment)
  end
end

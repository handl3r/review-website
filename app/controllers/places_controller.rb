class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  before_action :require_role_company, only: [:index]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /places
  # GET /places.json
  def index
    @places = Place.all
    @user = current_user
  end

  # GET /places/1
  # GET /places/1.json
  def show
  end

  # GET /places/new
  def new
    @place = Place.new
  end

  # GET /places/1/edit
  def edit
  end

  # POST /places
  # POST /places.json
  def create
    @place = Place.new(place_params.merge(user_id: current_user.id, numberRatings: 0, mediumRating: 0 ))

    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: 'Place was successfully created.' }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    respond_to do |format|
      user = User.find_for_authentication(email: current_user.email)
      if !user.valid_password?(params[:place][:current_password])
        flash[:danger] = "Check your password!"
        format.html { redirect_to edit_place_path(@place)}
      elsif @place.update(place_params_update.except(:current_password))
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:name,:address,:phoneNumber, :description, :service_id)
    end
  def place_params_update
    params.require(:place).permit(:name,:address,:phoneNumber, :description, :current_password, images: [])
  end
  def correct_user
    redirect_to root_path flash[:danger] = "This place is not belong to you" unless current_user == @place.user
  end
end

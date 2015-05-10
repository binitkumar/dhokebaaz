class DhokebaazsController < ApplicationController
  before_action :set_dhokebaaz, only: [:show, :edit, :update, :destroy]
  layout 'page'

  def index
    @people = Dhokebaaz.all
  end

  # GET /people/1
  # GET /people/1.json
  def show
    flash[:notice] = "let see.."
  end

  # GET /people/new
  def new
    @dhokebaaz = Dhokebaaz.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @dhokebaaz = Dhokebaaz.new(dhokebaaz_params)

    respond_to do |format|
      if @dhokebaaz.save
        format.html { redirect_to @dhokebaaz, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @dhokebaaz }
      else
        format.html { render :new }
        format.json { render json: @dhokebaaz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @dhokebaaz.update(dhokebaaz_params)
        format.html { redirect_to @dhokebaaz, notice: 'Dhokebaaz was successfully updated.' }
        format.json { render :show, status: :ok, location: @dhokebaaz }
      else
        format.html { render :edit }
        format.json { render json: @dhokebaaz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @dhokebaaz.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Dhokebaaz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dhokebaaz
      @dhokebaaz = Dhokebaaz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dhokebaaz_params
      params.require(:dhokebaaz).permit(:story, :incident_time, :dhokebaaz_name, :last_name, :address, :other_details, :fb_profile_url, :post_as_anonymous, :name, :email, :name_visible_to_public, :recive_update_on_comments, :recive_messages, :profile_image, :city, :zipcode, :proofs_attributes => [:id, :content, :detail, :_destroy])
    end
end

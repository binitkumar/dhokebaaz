class DhokebaazsController < ApplicationController
  before_action :set_dhokebaaz, only: [:show, :edit, :update, :destroy]
  before_action :set_tags, only: [:create, :update]
  layout 'page'

  def search
    if params[:first_name] ||  params[:last_name] || params[:zipcode]
      @dhokebaazs = Dhokebaaz.search("#{params[:first_name]} #{params[:last_name]} #{params[:zipcode]}").paginate(page: params[:page])
    else
      if( request.location )
        @dhokebaazs = Dhokebaaz.search(request.location.city).paginate(page: params[:page])
      else
        @dhokebaazs = Dhokebaaz.search("top").paginate(page: params[:page])
      end
    end

    params[:page] = params[:page].nil? ? 1 : params[:page].to_i
      
  end

  def index
    @dhokebaazs = current_user.dhokebaazs
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @comment = Comment.new
    @title = "Dhokebaaz profile of #{@dhokebaaz.dhokebaaz_name} #{@dhokebaaz.last_name} #{@dhokebaaz.address} #{@dhokebaaz.city}"
  end

  # GET /people/new
  def new
    @dhokebaaz = Dhokebaaz.new
  
    @tags = Tag.all
  end

  # GET /people/1/edit
  def edit
    @tags = Tag.all
  end

  # POST /people
  # POST /people.json
  def create
    @tags = Tag.all
    @dhokebaaz = Dhokebaaz.new(dhokebaaz_params)
    @dhokebaaz.user_id = current_user.id if current_user

    respond_to do |format|
      if verify_recaptcha(:model => @dhokebaaz, :message => "Oh! It's error with reCAPTCHA!") && @dhokebaaz.save
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
      if verify_recaptcha(:model => @dhokebaaz, :message => "Oh! It's error with reCAPTCHA!") && @dhokebaaz.update(dhokebaaz_params)
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
      format.html { redirect_to dhokebaazs_url, notice: 'Dhokebaaz was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dhokebaaz
      @dhokebaaz = Dhokebaaz.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dhokebaaz_params
      params.require(:dhokebaaz).permit(:story, :incident_time, :dhokebaaz_name, :last_name, :address, :other_details, :fb_profile_url, :post_as_anonymous, :name, :email, :name_visible_to_public, :recive_update_on_comments, :recive_messages, :profile_image, :city, :zipcode, :tags, :proofs_attributes => [:id, :content, :detail, :_destroy])
    end

    def set_tags
      params[:dhokebaaz][:tags] = params[:dhokebaaz][:tags].join(",").gsub(/^,/, "") if params[:dhokebaaz][:tags]
    end
end

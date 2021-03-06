class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  layout 'page'

  def index
    @people = Comment.all
  end

  # GET /people/1
  # GET /people/1.json
  def show
    flash[:notice] = "let see.."
  end

  # GET /people/new
  def new
    @comment = Comment.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id if current_user
    respond_to do |format|
      if verify_recaptcha(:model => @dhokebaaz, :message => "Oh! It's error with reCAPTCHA!") && @comment.save
        format.html { redirect_to @comment.dhokebaaz, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to :back, notice: 'Failed to add comment' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment.dhokebaaz, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:message, :dhokebaaz_id, :post_as_anonymas)
    end
end

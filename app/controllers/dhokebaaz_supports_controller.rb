class DhokebaazSupportsController < ApplicationController
  before_action :set_dhokebaaz_support, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @dhokebaaz_supports = DhokebaazSupport.all
    respond_with(@dhokebaaz_supports)
  end

  def show
    respond_with(@dhokebaaz_support)
  end

  def new
    @dhokebaaz_support = DhokebaazSupport.new
    respond_with(@dhokebaaz_support)
  end

  def edit
  end

  def create
    @dhokebaaz_support = DhokebaazSupport.new(dhokebaaz_support_params)
    @dhokebaaz_support.user_id = current_user.id if current_user
    @dhokebaaz_support.ip_address = request.remote_ip
    @dhokebaaz_support.save
    respond_with(@dhokebaaz_support.dhokebaaz)
  end

  def update
    @dhokebaaz_support.update(dhokebaaz_support_params)
    @dhokebaaz_support.user_id = current_user.id if current_user
    @dhokebaaz_support.ip_address = request.remote_ip
    @dhokebaaz_support.save
    respond_with(@dhokebaaz_support.dhokebaaz)
  end

  def destroy
    @dhokebaaz_support.destroy
    respond_with(@dhokebaaz_support)
  end

  private
    def set_dhokebaaz_support
      @dhokebaaz_support = DhokebaazSupport.find(params[:id])
    end

    def dhokebaaz_support_params
      params.require(:dhokebaaz_support).permit(:user_id, :dhokebaaz_id, :ip_address, :message, :post_as_anonymous)
    end
end

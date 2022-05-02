class BuyersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new
   # @item = @buyer_address.item_id
    #@buyer_address = Item.find(params[:id])
    # @item = Item.find(params[:id])
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      @buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_address).permit(:postal_code, :ship_from_area_id, :municipalities, :address, :building_name, :telephone).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
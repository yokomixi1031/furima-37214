class BuyersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create, :move_to_root_path]
  before_action :move_to_root_path, only: [:index]

  def index
    @buyer_address = BuyerAddress.new
   # @item = @buyer_address.item_id
    #@buyer_address = Item.find(params[:id])
    # @item = Item.find(params[:id])
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      pay_item
      @buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def buyer_params
    params.require(:buyer_address).permit(:postal_code, :ship_from_area_id, :municipalities, :address, :building_name, :telephone, :price).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_root_path
    redirect_to root_path if current_user.id == @item.user_id
    redirect_to root_path if @item.buyer.present?
  end

end
class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  # before_action :move_to_index, only: [:edit]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :explanation, :image, :category_id, :condition_id, :delivery_charge_id,
                                 :ship_from_area_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
end

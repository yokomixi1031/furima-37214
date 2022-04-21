class ItemsController < ApplicationController

  def index
    @item = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(article_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:item_name, :explanation, :image, :category_id, :condition_id, :delivery_charge_id, :ship_from_area_id, :delivery_day_id).merge(user_id: current_user.id)
  end

end

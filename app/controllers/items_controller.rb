class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    # Item.create(item_params)
    @items = Item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:product_name, :description, :genre_id, :status_id, :burden_id, :area_id, :day_id, :price, :user)
  end

end

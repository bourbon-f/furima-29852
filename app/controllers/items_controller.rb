class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    Tweet.create(item_params)
  end

  private
  
  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :status_id, :burden_id, :area_id, :days_id, :price, :user)
  end

end

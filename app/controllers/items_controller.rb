class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index]

  def index
    @items = Item.all.order(id: :DESC)
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
    if@items.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def destroy
    # @item = Item.find(params[:id])
    # @item.destroy
  end

  private
  
  def item_params
    params.require(:item).permit(:image, :product_name, :description, :genre_id, :status_id, :burden_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end

end
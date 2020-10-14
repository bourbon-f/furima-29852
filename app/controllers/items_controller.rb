class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index]

  def index
    @item = Item.all.order(id: :DESC)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if@item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
       redirect_to item_path
    else
       render :edit
    end
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
class OrdersController < ApplicationController
  before_action :move_to_index, only: :index
  before_action :move, only: :index
  before_action :set_order, only: [:index, :create]

  def index
    @order_form = OrderForm.new
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    else
      render :index
    end
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_item
      @order_form.save
      return redirect_to root_path
    else
      render 'index'
    end
  end


  private
  def order_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :tel_number, :price).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def move
    @item = Item.find(params[:item_id])
    if @item.order
      redirect_to root_path
    end
  end

  def set_order
    @item =Item.find(params[:item_id])
  end
end
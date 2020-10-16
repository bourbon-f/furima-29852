class OrdersController < ApplicationController
  before_action :move_to_index, only: :index

  def index
    @item =Item.find(params[:item_id])
    @order = OrderForm.new
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    else
      render :index
    end
  end

  def create
    @item =Item.find(params[:item_id])
    # @order = Order.new(price: order_params[:price])
    @order = OrderForm.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end


  private
  def order_params
    params.permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :tel_number, :user_id, :item_id, :price, :token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_6b5e6a43a0073e0e23bb68ed"
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
end
class OrdersController < ApplicationController
  before_action :move_to_index, only: :index

  def index
    @item =Item.find(params[:item_id])
    @order_form = OrderForm.new
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    else
      render :index
    end
  end

  def create
    @item =Item.find(params[:item_id])
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
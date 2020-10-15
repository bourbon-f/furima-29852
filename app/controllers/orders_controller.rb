class OrdersController < ApplicationController
  before_action :move_to_index, only: :index

  def index
    @item =Item.find(params[:item_id])
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
   else
      render :index
   end
  end

  # def show
  # end

  # def new
  # end

  # def create
  # end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
class OrdersController < ApplicationController
  before_action :move_to_index, only: :index

  def index
    @order = Order.all
  end

  def show
  end

  def new
  end

  def create
  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end
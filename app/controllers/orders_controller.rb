class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :move_to_index

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:town, :building, :city, :province_id, :post_code, :phone_number).merge(
      user_id: current_user.id, token: params[:token], item_id: params[:item_id]
    )
  end

  def pay_item
    Payjp.api_key = 'sk_test_357e63625743edc6789bc558'
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if @item.user == current_user || @item.order.present?
  end
end

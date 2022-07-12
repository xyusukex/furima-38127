class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @item = Item.all.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item = @item.includes(:user)
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :price, :delivery_charge_id, :explanation, :category_id, :quality_id,
                                 :province_id, :shipping_date_id).merge(user_id: current_user.id)
  end
end

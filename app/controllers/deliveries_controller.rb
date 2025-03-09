class DeliveriesController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @delivery = Delivery.new
    user_id = current_user.id 
    item_id = @item.id

    @buy_order = BuyOrder.new(user_id: user_id, item_id: item_id)
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.item_id = @item.id
    @delivery.user_id = current_user.id
    if @delivery.save
      redirect_to item_deliveries_path(@item), notice: 'Delivery was successfully created.'
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def delivery_params
    params.require(:delivery).permit(:buy_some, :adress_num, :prefecture_id, :first_adress, :second_adress, :bulding_name, :tel_num)
  end
end
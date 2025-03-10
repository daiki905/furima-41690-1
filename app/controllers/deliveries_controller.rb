# app/controllers/deliveries_controller.rb
class DeliveriesController < ApplicationController
  def index
    @buy_order = BuyOrder.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_order = BuyOrder.new(buy_order_params)
    if @buy_order.valid?
      @buy_order.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def buy_order_params
    params.require(:buy_order).permit(:user_id, :item_id, :adress_num, :shippingsource_id, :first_adress, :second_adress, :bulding_name, :tel_num, :token).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
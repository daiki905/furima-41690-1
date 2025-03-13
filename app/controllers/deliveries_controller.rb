# app/controllers/deliveries_controller.rb
class DeliveriesController < ApplicationController
  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @buy_order = BuyOrder.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_order = BuyOrder.new(buy_order_params)
    if @buy_order.valid?
      pay_item
      @buy_order.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def buy_order_params
    params.require(:buy_order).permit(:adress_num, :prefecture_id, :first_adress, :second_adress, :bulding_name, :tel_num,:token)
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.item_money,  # 商品の値段
      card: buy_order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
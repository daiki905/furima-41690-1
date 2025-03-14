class DeliveriesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :check_item_owner, only: [:index, :create]
  before_action :redirect_if_restricted, only: [:index]


  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @buy_order = BuyOrder.new
  end

  def create
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

  def redirect_if_restricted
    if @item.buy_some.present? || current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def check_item_owner
    if @item.user_id == current_user.id
      redirect_to root_path, notice: "このページにはアクセスできません。"
    end
  end

  def buy_order_params
    params.require(:buy_order).permit(:adress_num, :prefecture_id, :first_adress, :second_adress, :bulding_name, :tel_num, :token)
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.item_money,
      card: buy_order_params[:token],
      currency: 'jpy'
    )
  end
end
class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.order(created_at: :desc)
  end


  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path, notice: 'Item was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @item = Item.new
  end
  
  def show
    @item = Item.find(params[:id])
    @user = @item.user
  end

  private
  
  def item_params
    params.require(:item).permit(:item_name, :item_money, :item_manual, :category_id, :item_status_id, :shippingsource_id, :payee_id, :readtime_id, :image).merge(user_id: current_user.id)
  end
  end


  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

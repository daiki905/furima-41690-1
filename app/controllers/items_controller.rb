class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
  end

  def new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to @item, notice: 'Item was successfully created.'
    else
      render :new
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:category_id, :item_status_id, :shippingsource_id, :payee_id, :readtime_id)
  end
  end

  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :ensure_owner, only: [:edit, :update, :destroy]

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
    @user = @item.user
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: '商品情報が更新されました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: 'Item was successfully deleted.'
  end

  

  private
  def set_item
    @item = Item.find(params[:id])
  end

  
  def ensure_owner
    unless @item.user_id == current_user.id
      redirect_to root_path, notice: 'このページにはアクセスできません。'
    end
  end
  
  def item_params
    params.require(:item).permit(:item_name, :item_money, :item_manual, :category_id, :item_status_id, :shippingsource_id, :payee_id, :readtime_id, :image).merge(user_id: current_user.id)
  end
  end


  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

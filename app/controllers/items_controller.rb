class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :find_item, only: [:edit, :update]
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :ensure_owner, only: [:edit, :update]

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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    if @item.update(item_params)
      redirect_to @item, notice: '商品情報が更新されました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  

  private

  
  def ensure_owner
    @item = Item.find(params[:id])
    unless @item.user_id == current_user.id
      redirect_to root_path, notice: 'このページにはアクセスできません。'
    end
  end

  def find_item
    @item = Item.find_by(id: params[:id])
    unless @item
      redirect_to root_path, alert: '商品が見つかりません。'
      return
    end
  end

  def redirect_if_not_seller
    if @item.nil? || @item.user != current_user
      redirect_to root_path, alert: '他のユーザーの商品情報は編集できません。'
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

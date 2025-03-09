class BuyOrder
  include ActiveModel::Model
  attr_accessor :buy_some,:delivery, :user_id, :item_id, :some_value

  #val


def save
  buy_order = BuyOrder.new(user_id: user_id, item_id: item_id)
  if buy.save
    buy_order_detail = BuyOrderDetail.new(purchase_history_id: purchase_history.id, some_other_data: some_value)
    buy_order_detail.save
  else
    render 'index', status: :unprocessable_entity
  end
end
end
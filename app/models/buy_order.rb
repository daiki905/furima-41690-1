class BuyOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :adress_num, :shippingsource_id, :first_adress, :second_adress, :bulding_name, :tel_num, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :adress_num
    validates :shippingsource_id
    validates :first_adress
    validates :second_adress
    validates :tel_num
    validates :token
  end

  def save
    buy_order = BuyOrder.create(user_id: user_id, item_id: item_id)
    Delivery.create(
      adress_num: address_num, shippingsource_id: shippingsource_id,
      first_adress: first_adress, second_adress: second_adress,
      bulding_name: bulding_name, tel_num: tel_num,
      buy_order_id: buy_order.id
    )
  end
end
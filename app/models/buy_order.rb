class BuyOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :adress_num, :prefecture_id, :first_adress, :second_adress, :bulding_name, :tel_num, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :adress_num
    validates :prefecture_id
    validates :first_adress
    validates :second_adress
    validates :tel_num
    validates :token
  end

  def save
    buy_some = BuySome.create(user_id: user_id, item_id: item_id)
    Delivery.create(
      adress_num: adress_num, prefecture_id: prefecture_id,
      first_adress: first_adress, second_adress: second_adress,
      bulding_name: bulding_name, tel_num: tel_num,
      buy_some_id: buy_some.id
    )
  end
end
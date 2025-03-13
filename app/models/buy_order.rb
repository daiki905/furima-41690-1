class BuyOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :adress_num, :prefecture_id, :first_adress, :second_adress, :bulding_name, :tel_num, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :adress_num, format: { with: /\A\d{3}-\d{4}\z/, message: 'は「3桁-4桁」の形式で入力してください。' }
    validates :prefecture_id
    validates :first_adress
    validates :second_adress
    validates :tel_num, format: { with: /\A\d{10,11}\z/, message: 'は「10桁から11桁の半角数値」で入力してください。' }
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
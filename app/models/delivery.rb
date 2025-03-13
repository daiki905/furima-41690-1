class Delivery < ApplicationRecord

  validates :adress_num, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: 'は「3桁-4桁」の形式で入力してください。' }
  validates :prefecture_id, presence: { message: "can't be blank" }
  validates :first_adress, presence: { message: "can't be blank" }
  validates :second_adress, presence: { message: "can't be blank" }
  validates :bulding_name, presence: { allow_blank: true }
  validates :tel_num, presence: { message: "can't be blank" }

  belongs_to :buy_some


end



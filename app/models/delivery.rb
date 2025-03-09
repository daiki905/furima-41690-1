class Delivery < ApplicationRecord

  validates :adress_num, presence: { message: "can't be blank" }
  validates :prefecture_id, presence: { message: "can't be blank" }
  validates :first_adress, presence: { message: "can't be blank" }
  validates :second_adress, presence: { message: "can't be blank" }
  validates :building_name, presence: { allow_blank: true }
  validates :tel_num, presence: { message: "can't be blank" }

  belongs_to :buy_some

end



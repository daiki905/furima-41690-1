class Item < ApplicationRecord


  validates :item_name, presence: true
  validates :first_mony, presence: true
  validates :category_id, presence: true 
  validates :item_manual, presence: true
  validates :item_status_id,presence: true 
  validates :payee_id,presence: true
  validates :shippingsource_id,presence: true 
  validates :readtime_id,presence: true

  belongs_to :user


  has_one_attached :image

end

class Item < ApplicationRecord


  validates :item_name, presence: true
  validates :first_mony, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_manual, presence: true
  validates :item_status_id,numericality: { other_than: 1 , message: "can't be blank"} 
  validates :payee_id,presence: true
  validates :shippingsource_id,presence: true 
  validates :readtime_id,presence: true

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_status
  belongs_to :Payee
  belongs_to :Shippingsource
  belongs_to :Readtime



  has_one_attached :image

  validates :image, presence: true

end

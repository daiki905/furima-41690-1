class Item < ApplicationRecord


  validates :item_name, presence: true
  validates :item_money, presence: true,numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/, message: "must be half-width number" }
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_manual,  presence: true
  validates :item_status_id,numericality: { other_than: 1 , message: "can't be blank"} 
  validates :payee_id,numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shippingsource_id,numericality: { other_than: 1 , message: "can't be blank"} 
  validates :readtime_id,numericality: { other_than: 1 , message: "can't be blank"} 
  validates :user, presence: true
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_status
  belongs_to :Payee
  belongs_to :Shippingsource
  belongs_to :Readtime
  belongs_to :category



  has_one_attached :image

  validates :image, presence: true

end

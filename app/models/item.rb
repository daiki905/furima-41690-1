class Item < ApplicationRecord


  validates :item_name, presence: true
  validates :item_money, presence: true
  validates :item_money, numericality: { only_integer: true, greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999, allow_nil: true, }
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_manual,  presence: true
  validates :item_status_id,numericality: { other_than: 1 , message: "can't be blank"} 
  validates :payee_id,numericality: { other_than: 1 , message: "can't be blank"} 
  validates :shippingsource_id,numericality: { other_than: 1 , message: "can't be blank"} 
  validates :readtime_id,numericality: { other_than: 1 , message: "can't be blank"} 
  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_status
  belongs_to :payee
  belongs_to :shippingsource
  belongs_to :readtime
  belongs_to :category
  
  has_one :buy_some
  belongs_to :user



  has_one_attached :image

  validates :image, presence: true

end

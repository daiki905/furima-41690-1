class CreateDeliveries < ActiveRecord::Migration[7.1]
  def change
    create_table :deliveries do |t|

      t.string   :adress_num,        null: false
      t.integer  :prefecture_id,    null: false 
      t.string   :first_adress,     null: false
      t.string   :second_adress,    null: false
      t.string   :bulding_name
      t.string   :tel_num, null: false
      t.references :buy_some, null: false, foreign_key: true
      

      t.timestamps
    end
  end
end



class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :item_name, null:false
     t.integer :item_money, null:false
     t.references :user, null: false, foreign_key: true
     t.integer :category_id, null:false
     t.text :item_manual, null:false
     t.integer :item_status_id, null:false
     t.integer   :payee_id,    null:false
     t.integer :shippingsource_id, null:false
     t.integer   :readtime_id,    null:false 


      t.timestamps
    end
  end
end


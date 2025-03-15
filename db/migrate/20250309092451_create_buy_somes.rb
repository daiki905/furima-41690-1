class CreateBuySomes < ActiveRecord::Migration[7.1]
  def change
    create_table :buy_somes do |t|

      t.references :user, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true

      t.timestamps
    end
  end
end

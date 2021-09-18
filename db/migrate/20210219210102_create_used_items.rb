class CreateUsedItems < ActiveRecord::Migration[6.0]
  def change
    create_table :used_items do |t|
      t.integer :item_id
      t.integer :charged_price
      t.integer :case_id

      t.timestamps
    end
  end
end

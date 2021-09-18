class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.integer :default_price
      t.boolean :available

      t.timestamps
    end
  end
end

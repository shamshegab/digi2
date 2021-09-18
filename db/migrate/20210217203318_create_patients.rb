class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :mobile
      t.string :name
      t.text :address
      t.string :email

      t.timestamps
    end
  end
end

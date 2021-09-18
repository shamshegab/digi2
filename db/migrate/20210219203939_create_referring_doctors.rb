class CreateReferringDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :referring_doctors do |t|
      t.string :name
      t.string :email
      t.text :address
      t.string :phone

      t.timestamps
    end
  end
end

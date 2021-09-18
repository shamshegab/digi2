class CreateCases < ActiveRecord::Migration[6.0]
  def change
    create_table :cases do |t|
      t.text :note
      t.integer :owner_id
      t.integer :patient_id
      t.integer :referring_doctor_id
      t.integer :technition_id
      t.integer :doctor_id
      t.date :ended

      t.timestamps
    end
  end
end

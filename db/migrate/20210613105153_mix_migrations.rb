class MixMigrations < ActiveRecord::Migration[6.0]
  def change
    add_column :referring_doctors, :clinic, :string
    add_column :referring_doctors, :mobile, :string
    add_column :referring_doctors, :birthdate, :date
   
    add_column :cases, :contacted, :datetime
    add_column :cases, :reported, :datetime
    change_column :cases, :ended, :datetime

    add_column :users, :address, :string
    add_column :users, :mobile, :string
    add_column :users, :birthdate, :date

  end
end

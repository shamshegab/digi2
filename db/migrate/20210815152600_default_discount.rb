class DefaultDiscount < ActiveRecord::Migration[6.0]
  def change
    change_column :cases, :discount, :float, :default => 0.0
    #Ex:- :default =>''
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end

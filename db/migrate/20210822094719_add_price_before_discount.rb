class AddPriceBeforeDiscount < ActiveRecord::Migration[6.0]
  def change
    add_column :used_items, :price_before_discount, :float, :default => 0.0
    #Ex:- :default =>''
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end

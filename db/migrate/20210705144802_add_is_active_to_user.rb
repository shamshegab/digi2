class AddIsActiveToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_active, :boolean, :default => true
    #Ex:- :default =>''
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end

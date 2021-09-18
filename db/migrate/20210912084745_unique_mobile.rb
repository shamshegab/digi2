class UniqueMobile < ActiveRecord::Migration[6.0]
  def change
    change_column :patients, :mobile, :string, :unique =>  true
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end

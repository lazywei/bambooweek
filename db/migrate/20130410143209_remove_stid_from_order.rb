class RemoveStidFromOrder < ActiveRecord::Migration
  def up
    remove_column :orders, :stid
  end

  def down
    add_column :orders, :stid, :string
  end
end

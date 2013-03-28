class AddDrawDateToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :draw_date, :integer
  end
end

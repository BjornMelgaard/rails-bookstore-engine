class AddStateToShopperOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :shopper_orders, :state, :integer, null: false
  end
end

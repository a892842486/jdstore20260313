class AddDefaultQuantityToProducts < ActiveRecord::Migration[8.1]
  def change
    change_column_default :products, :quantity, 0
    change_column_null :products, :quantity, false, 0
  end
end

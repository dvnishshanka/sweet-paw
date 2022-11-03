class AddPriceToPets < ActiveRecord::Migration[7.0]
  def change
    add_column :pets, :price, :integer
  end
end

class RemovePostCodeFromPets < ActiveRecord::Migration[7.0]
  def change
    remove_column :pets, :postcode
  end
end

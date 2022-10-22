class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :age
      t.string :species
      t.string :category
      t.integer :postcode
      t.string :city
      t.text :description

      t.timestamps
    end
  end
end

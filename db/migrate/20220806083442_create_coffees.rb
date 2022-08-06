class CreateCoffees < ActiveRecord::Migration[6.1]
  def change
    create_table :coffees do |t|
      t.integer :end_user_id
      t.string :image_id
      t.text :text

      t.timestamps
    end
  end
end

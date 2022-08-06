class CreateCoffeeComments < ActiveRecord::Migration[6.1]
  def change
    create_table :coffee_comments do |t|
      t.integer :end_user_id
      t.integer :coffee_id
      t.string :image_id
      t.string :comment

      t.timestamps
    end
  end
end

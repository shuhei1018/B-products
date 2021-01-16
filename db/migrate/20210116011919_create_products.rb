class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|

      t.string :name, null: false
      t.integer :status_id, null: false
      t.text :explanation, null: false
      t.integer :price 
      # t.references :user, null: false, foreign_key: true
      # アソシエーション後に記述し直す
      t.timestamps
    end
  end
end

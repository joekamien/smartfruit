class CreateFruits < ActiveRecord::Migration[8.1]
  def change
    create_table :fruits do |t|
      t.string :name, null: false
      t.string :colors, array: true, default: [], null: false
      t.boolean :in_season, null: false

      t.timestamps
    end
  end
end

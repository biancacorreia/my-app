class CreateEntries < ActiveRecord::Migration[8.1]
  def change
    create_table :entries do |t|
      t.string :fragrance_name
      t.string :brand
      t.string :occasion
      t.integer :strength
      t.text :notes
      t.date :worn_on

      t.timestamps
    end
  end
end

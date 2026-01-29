class CreateCurrencies < ActiveRecord::Migration[7.1]
  def change
    create_table :currencies do |t|
      t.string :code, limit: 3, null: false
      t.string :name, limit: 100, null: false
      t.string :symbol, limit: 10, null: false
      t.decimal :exchange_rate, precision: 12, scale: 6, default: 1.0, null: false
      t.boolean :is_base, default: false, null: false
      t.boolean :active, default: true, null: false
      t.timestamps
    end
    add_index :currencies, :code, unique: true
    add_index :currencies, :active
  end
end
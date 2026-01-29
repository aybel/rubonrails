class CreateSupplierTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :supplier_types do |t|
      t.string :code, limit: 50, null: false
      t.string :name, limit: 100, null: false
      t.string :description, limit: 255
      t.boolean :active, default: true, null: false
      t.timestamps
    end
    add_index :supplier_types, :code, unique: true
  end
end
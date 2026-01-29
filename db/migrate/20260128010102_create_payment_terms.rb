class CreatePaymentTerms < ActiveRecord::Migration[7.1]
  def change
    create_table :payment_terms do |t|
      t.string :code, limit: 20, null: false
      t.string :name, limit: 100, null: false
      t.integer :days, null: false
      t.text :description
      t.boolean :active, default: true, null: false
      t.timestamps
    end
    add_index :payment_terms, :code, unique: true
    add_index :payment_terms, :active
  end
end
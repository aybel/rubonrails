class CreateSuppliers < ActiveRecord::Migration[7.1]
  def change
    create_table :suppliers do |t|
      t.string :code, limit: 20, null: false
      t.string :name, limit: 255, null: false
      t.string :tax_id, limit: 20
      t.references :supplier_type, foreign_key: true
      t.references :supplier_status, null: false, foreign_key: true, default: 1
      t.decimal :quality_score, precision: 3, scale: 2, default: 0.0
      t.decimal :delivery_score, precision: 3, scale: 2, default: 0.0
      t.references :payment_term, null: false, foreign_key: true, default: 3
      t.references :currency, null: false, foreign_key: true, default: 1
      t.decimal :credit_limit, precision: 15, scale: 2, default: 0.0
      t.references :city, foreign_key: true
      t.string :address, limit: 500
      t.string :notes, limit: 500
      t.boolean :active, default: true, null: false
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
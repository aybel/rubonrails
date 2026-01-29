class CreateSupplierContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :supplier_contacts do |t|
      t.references :supplier, null: false, foreign_key: true
      t.string :name, limit: 255, null: false
      t.string :email, limit: 255
      t.string :phone, limit: 20
      t.string :mobile, limit: 20
      t.string :position, limit: 100
      t.string :department, limit: 100
      t.boolean :primary, default: false, null: false
      t.boolean :active, default: true, null: false
      t.text :notes
      t.timestamps
    end
    add_index :supplier_contacts, :primary
  end
end
class CreateEchos < ActiveRecord::Migration[8.1]
  def change
    create_table :echos do |t|
      t.text :message

      t.timestamps
    end
  end
end

class CreatePayloads < ActiveRecord::Migration[7.1]
  def change
    create_table :payloads do |t|
      t.references :vehicle, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.timestamps
    end
  end
end

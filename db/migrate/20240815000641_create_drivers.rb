class CreateDrivers < ActiveRecord::Migration[7.1]
  def change
    create_table :drivers do |t|
      t.string :nome
      t.integer :matricula
      t.string :endereco
      t.integer :telefone
      t.string :login
      t.string :senha

      t.timestamps
    end
  end
end

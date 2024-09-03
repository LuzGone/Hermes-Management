class CreateDrivers < ActiveRecord::Migration[7.1]
  def change
    create_table :drivers do |t|
      t.string :nome
      t.string :matricula
      t.string :endereco
      t.string :telefone
      t.string :situacao
      t.string :login
      t.string :senha

      t.timestamps
    end
  end
end

class CreateAdmins < ActiveRecord::Migration[7.1]
  def change
    create_table :admins do |t|
      t.string :login
      t.string :senha

      t.timestamps
    end
  end
end

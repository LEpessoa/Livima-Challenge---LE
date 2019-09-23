class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :nome
      t.string :email
      t.string :cargo
      t.float :salário

      t.timestamps
    end
  end
end
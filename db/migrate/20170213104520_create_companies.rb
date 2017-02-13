class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.integer :budget
      t.integer :employee_emount
      t.string :address

      t.timestamps null: false
    end
  end
end

class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.integer :income, limit: 8
      t.integer :employee_amount, limit: 8
      t.string :address

      t.timestamps null: false
    end
  end
end

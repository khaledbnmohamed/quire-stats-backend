class AddIndexToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_index :employees, :email, unique: true
    add_index :employees, :mobile, unique: true
  end
end

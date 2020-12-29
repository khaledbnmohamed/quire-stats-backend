class AddFieldsToEmployees < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :national_id, :string
    add_column :employees, :vehicle_type, :string
    add_column :employees, :bank_name, :string
    add_column :employees, :bank_account_number, :string
    add_column :employees, :bank_account_holder_name, :string
    add_column :employees, :confirmed, :boolean, default: false
    add_column :employees, :saudi, :boolean, default: true
  end
end

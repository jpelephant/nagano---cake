class RenameIsActiveColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :is_active, :is_deleted
  end
end

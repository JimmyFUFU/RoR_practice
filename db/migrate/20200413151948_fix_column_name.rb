class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :lessons, :type, :category
  end
end

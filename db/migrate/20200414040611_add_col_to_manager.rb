class AddColToManager < ActiveRecord::Migration[5.1]
  def change
    add_column :managers, :name, :string
    add_column :managers, :email, :string
    add_column :managers, :password, :string
    add_column :managers, :access_token, :string
    add_column :managers, :access_expired, :timestamp
  end
end

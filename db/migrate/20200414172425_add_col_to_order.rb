class AddColToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :lesson_id, :string
    add_column :orders, :user_id, :string
    add_column :orders, :checkout_time, :date
    add_column :orders, :expired_time, :date
  end
end

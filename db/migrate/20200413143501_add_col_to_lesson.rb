class AddColToLesson < ActiveRecord::Migration[5.1]
  def change
    add_column :lessons, :title, :string
    add_column :lessons, :price, :integer
    add_column :lessons, :currency, :string
    add_column :lessons, :category, :string
    add_column :lessons, :status, :string
    add_column :lessons, :url, :text
    add_column :lessons, :description, :text
    add_column :lessons, :expired_time, :timestamp
  end
end

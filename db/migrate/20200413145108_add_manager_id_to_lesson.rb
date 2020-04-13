class AddManagerIdToLesson < ActiveRecord::Migration[5.1]
  def change
        add_column :lessons, :manager_id, :string
  end
end

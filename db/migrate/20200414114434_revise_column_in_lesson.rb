class ReviseColumnInLesson < ActiveRecord::Migration[5.1]
  def change
    rename_column :lessons, :expired_time, :expired_days
    change_column :lessons, :expired_days, :integer
  end
end

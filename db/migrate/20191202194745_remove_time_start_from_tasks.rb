class RemoveTimeStartFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :time_started
   end
end

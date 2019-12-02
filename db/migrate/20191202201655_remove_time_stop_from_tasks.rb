class RemoveTimeStopFromTasks < ActiveRecord::Migration
  def change
    remove_column :tasks, :time_stopped
  end
end

class AddHrsWorkedToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :hrs_worked, :decimal
  end
end

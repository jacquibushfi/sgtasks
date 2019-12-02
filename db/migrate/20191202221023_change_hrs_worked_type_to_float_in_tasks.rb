class ChangeHrsWorkedTypeToFloatInTasks < ActiveRecord::Migration
  def change
    change_column :tasks, :hrs_worked, :float
  end
end

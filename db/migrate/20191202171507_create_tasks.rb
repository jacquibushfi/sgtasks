class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.date :date_worked
      t.time :time_started
      t.time :time_stopped
      t.string :task
      t.string :project_title
      t.integer :user_id
    end
  end
end

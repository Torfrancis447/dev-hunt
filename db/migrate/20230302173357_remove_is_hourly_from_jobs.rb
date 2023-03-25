class RemoveIsHourlyFromJobs < ActiveRecord::Migration[7.0]
  def change
    remove_column :jobs, :is_hourly, :boolean
    remove_column :jobs, :is_salary, :boolean
  end
end

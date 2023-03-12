class RemoveSalaryAndHourlyFromJobs < ActiveRecord::Migration[7.0]
  def change
    remove_column :jobs, :hourly, :float
    remove_column :jobs, :salary, :integer
  end
end

class AddCompensationToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :compensation, :float
  end
end

class AddPositionToJobs < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :title, :string
  end
end

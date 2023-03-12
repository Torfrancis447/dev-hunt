class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :description
      t.boolean :is_hourly
      t.float :hourly
      t.boolean :is_salary
      t.integer :salary
      t.string :location_type
      t.string :employment_type

      t.timestamps
    end
  end
end

class CreateJobSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :job_skills do |t|
      t.integer :job_id
      t.integer :skill_id

      t.timestamps
    end
  end
end

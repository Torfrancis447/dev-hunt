class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.string :avaliability
      t.boolean :sponsorship
      t.boolean :work_authorization

      t.timestamps
    end
  end
end

class AddIsEmployerToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_employer, :boolean
  end
end

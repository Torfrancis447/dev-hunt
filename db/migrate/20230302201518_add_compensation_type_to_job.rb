class AddCompensationTypeToJob < ActiveRecord::Migration[7.0]
  def change
    add_column :jobs, :compensation_type, :string
  end
end

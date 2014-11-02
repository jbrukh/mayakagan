class AddPositionToProjectDetail < ActiveRecord::Migration
  def change
    add_column :project_details, :position, :integer
  end
end

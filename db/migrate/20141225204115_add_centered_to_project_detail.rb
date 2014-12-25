class AddCenteredToProjectDetail < ActiveRecord::Migration
  def change
    add_column :project_details, :centered, :boolean, default: false
  end
end

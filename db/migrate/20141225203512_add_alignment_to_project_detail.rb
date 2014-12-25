class AddAlignmentToProjectDetail < ActiveRecord::Migration
  def change
    add_column :project_details, :alignment, :string
  end
end

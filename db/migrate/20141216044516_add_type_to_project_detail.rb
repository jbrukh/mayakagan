class AddTypeToProjectDetail < ActiveRecord::Migration
  def change
    add_column :project_details, :type, :string, default: 'image'
  end
end

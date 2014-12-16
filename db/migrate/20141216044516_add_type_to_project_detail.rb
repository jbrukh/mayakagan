class AddTypeToProjectDetail < ActiveRecord::Migration
  def change
    add_column :project_details, :detail_type, :string, default: 'image'
  end
end

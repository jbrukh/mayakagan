class AddDetailPaddingToProjectDetail < ActiveRecord::Migration
  def change
    add_column :project_details, :detail_padding, :boolean, default: true
  end
end

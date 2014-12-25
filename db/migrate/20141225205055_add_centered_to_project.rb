class AddCenteredToProject < ActiveRecord::Migration
  def change
    add_column :projects, :centered, :boolean, default: false
  end
end

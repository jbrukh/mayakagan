class AddCenteredToProject < ActiveRecord::Migration
  def change
    add_column :projects, :centered, :boolean
  end
end

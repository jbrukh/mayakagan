class AddBottomPaddingToProject < ActiveRecord::Migration
  def change
    add_column :projects, :bottom_padding, :boolean, :default => true
  end
end

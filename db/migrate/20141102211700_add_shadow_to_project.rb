class AddShadowToProject < ActiveRecord::Migration
  def change
    add_column :projects, :shadow, :boolean, :default => false
  end
end

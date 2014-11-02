class AddLengthToProjectDescription < ActiveRecord::Migration

  def change
    change_column :project, :description, :string, :limit => 2048
  end

end

class AddLengthToProjectDetailDescription < ActiveRecord::Migration
 def change
    change_column :project_details, :description, :text
  end
end

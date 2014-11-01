class CreateProjectDetails < ActiveRecord::Migration
  def change
    create_table :project_details do |t|
      t.string :description
      t.integer :project_id, :null => false
      t.timestamps
    end
  end
end

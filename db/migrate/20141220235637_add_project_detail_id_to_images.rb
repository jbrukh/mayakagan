class AddProjectDetailIdToImages < ActiveRecord::Migration
  def change
    add_reference :images, :project_detail, index: true
  end
end

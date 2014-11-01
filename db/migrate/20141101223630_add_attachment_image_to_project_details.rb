class AddAttachmentImageToProjectDetails < ActiveRecord::Migration
  def self.up
    change_table :project_details do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :project_details, :image
  end
end

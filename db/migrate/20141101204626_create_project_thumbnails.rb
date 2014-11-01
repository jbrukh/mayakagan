class CreateProjectThumbnails < ActiveRecord::Migration
  def self.up
    create_table :thumbnails do |t|
      t.integer    :project_id
      t.string     :style
      t.binary     :file_contents
    end
  end

  def self.down
    drop_table :thumbnails
  end
end

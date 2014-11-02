class ProjectDetail < ActiveRecord::Base

  belongs_to :project

  # Image

  has_attached_file :image, :styles => { :thumb => "600x600>" }, :default_url => "missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end

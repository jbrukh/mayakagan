class Project < ActiveRecord::Base

  has_many :project_details, :dependent => :destroy

  ## Thumbnail

  has_attached_file :thumbnail, :styles => { :thumb => "300x300>" }, :default_url => "missing.png"
  validates_attachment_content_type :thumbnail, :content_type => /\Aimage\/.*\Z/

  ## Hero

  has_attached_file :hero, :default_url => "missing.png"
  validates_attachment_content_type :hero, :content_type => /\Aimage\/.*\Z/

end

class Project < ActiveRecord::Base

  has_attached_file :thumbnail, :styles => { :thumb => "300x300>" }, :default_url => "missing.png"
  validates_attachment_content_type :thumbnail, :content_type => /\Aimage\/.*\Z/

end

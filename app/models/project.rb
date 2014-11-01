class Project < ActiveRecord::Base

  has_attached_file :thumbnail, :storage => :database, :styles => { :thumb => "300x300>" }, :default_url => "/assets/missing.png"
  validates_attachment_content_type :thumbnail, :content_type => /\Aimage\/.*\Z/

end

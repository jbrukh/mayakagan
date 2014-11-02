class Project < ActiveRecord::Base

  has_many :project_details, :dependent => :destroy

  ## Thumbnail

  has_attached_file :thumbnail, :styles => { :thumb => "350x350>" }, :default_url => "missing.png"
  validates_attachment_content_type :thumbnail, :content_type => /\Aimage\/.*\Z/

  ## Hero

  has_attached_file :hero, :styles => { :thumb => "350x350>" }, :default_url => "missing.png"
  validates_attachment_content_type :hero, :content_type => /\Aimage\/.*\Z/

  def next
    Project.where("id > ?", id).first
  end

  def prev
    Project.where("id < ?", id).last
  end

end

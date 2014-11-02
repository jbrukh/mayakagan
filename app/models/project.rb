class Project < ActiveRecord::Base

  has_many :project_details, -> { order("position ASC") }, :dependent => :destroy
  scope :ordered, -> { order("position ASC") }
  acts_as_list

  ## Thumbnail

  has_attached_file :thumbnail, :styles => { :thumb => "600x600>" }, :default_url => "missing.png"
  validates_attachment_content_type :thumbnail, :content_type => /\Aimage\/.*\Z/

  ## Hero

  has_attached_file :hero, :styles => { :thumb => "600x600>" }, :default_url => "missing.png"
  validates_attachment_content_type :hero, :content_type => /\Aimage\/.*\Z/

  def next
    lower_items.first
  end

  def prev
    higher_items.last
  end

end

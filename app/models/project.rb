class Project < ActiveRecord::Base

  has_many :project_details, -> { order("position ASC") }, :dependent => :destroy
  accepts_nested_attributes_for :project_details

  scope :ordered, -> { order("position ASC") }
  acts_as_list

  ## Slugs
  extend FriendlyId
  friendly_id :title, use: :slugged

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

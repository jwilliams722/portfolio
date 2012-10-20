class Project < ActiveRecord::Base
  attr_accessible :content, :title, :image

  mount_uploader :image, ImageUploader

  validates :title, :content, presence: true

end
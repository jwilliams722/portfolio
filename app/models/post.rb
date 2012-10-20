class Post < ActiveRecord::Base
  attr_accessible :content, :preview, :title, :publish_at


  validates :title, :content, presence: true

end

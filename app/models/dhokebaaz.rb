class Dhokebaaz < ActiveRecord::Base

  has_many :proofs
  has_many :comments

  has_attached_file :profile_image
  validates_attachment_content_type :profile_image, :content_type => ['image/jpeg', 'image/jpg', 'image/png']

  accepts_nested_attributes_for :proofs

  def visible_name
    self.name_visible_to_public && !self.post_as_anonymous ? self.name : "Anonymous"
  end
end

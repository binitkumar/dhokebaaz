class Dhokebaaz < ActiveRecord::Base

  has_many :proofs
  has_many :comments
  belongs_to :user

  has_attached_file :profile_image, default_url: 'dhokebaaz.jpg'
  validates_attachment_content_type :profile_image, :content_type => ['image/jpeg', 'image/jpg', 'image/png']

  validates_presence_of :dhokebaaz_name, :story

  accepts_nested_attributes_for :proofs

  def poster_name
    self.name_visible_to_public && !self.post_as_anonymous ? self.name : "Anonymous"
  end

  def poster_image_url
    if self.post_as_anonymous || self.user.nil?
      "profile_picture.png"
    else
      self.user.profile_image.url
    end
  end

  def full_name
    "#{self.dhokebaaz_name} #{self.last_name}"
  end
end

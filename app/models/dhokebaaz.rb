class Dhokebaaz < ActiveRecord::Base
  has_many :proofs
  has_many :dhokebaaz_supports
  has_many :comments
  belongs_to :user

  has_attached_file :profile_image, default_url: 'dhokebaaz.jpg'
  validates_attachment_content_type :profile_image, :content_type => ['image/jpeg', 'image/jpg', 'image/png']

  validates_presence_of :dhokebaaz_name, :story

  accepts_nested_attributes_for :proofs

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
      [:dhokebaaz_name, :last_name],
      [:dhokebaaz_name, :last_name, :address],
      [:dhokebaaz_name, :last_name, :address, :city]
    ]
  end

  search_syntax do
    search_by :text do |scope, phrases|
      columns = [:dhokebaaz_name, :last_name, :address, :city, :zipcode]
      scope.where_like(columns => phrases)
    end
  end


  def poster_name
    if self.post_as_anonymous || self.user.nil?
      "Anonymous"
    else
      self.user.username
    end
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

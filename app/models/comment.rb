class Comment < ActiveRecord::Base
  belongs_to :dhokebaaz
  belongs_to :user

  def poster_name
    if self.post_as_anonymas || self.user.nil?
      "Anonymas"
    else
      self.user.username 
    end
  end
  def poster_image_url
    if self.post_as_anonymas || self.user.nil?
      "profile_picture.png"
    else
     self.user.profile_image.url     
    end
  end
end

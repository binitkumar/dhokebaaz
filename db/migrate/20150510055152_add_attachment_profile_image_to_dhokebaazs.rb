class AddAttachmentProfileImageToDhokebaazs < ActiveRecord::Migration
  def self.up
    change_table :dhokebaazs do |t|
      t.attachment :profile_image
    end
  end

  def self.down
    remove_attachment :dhokebaazs, :profile_image
  end
end

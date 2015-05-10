class AddAttachmentContentToProofs < ActiveRecord::Migration
  def self.up
    change_table :proofs do |t|
      t.attachment :content
    end
  end

  def self.down
    remove_attachment :proofs, :content
  end
end

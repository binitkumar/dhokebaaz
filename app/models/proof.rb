class Proof < ActiveRecord::Base
  belongs_to :dhokebaaz
  has_attached_file :content

  do_not_validate_attachment_file_type :content
  validates_presence_of :detail
end

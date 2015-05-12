class DhokebaazSupport < ActiveRecord::Base
  belongs_to :dhokebaaz
  belongs_to :user

  validates_uniqueness_of :ip_address, scope: :dhokebaaz_id
end

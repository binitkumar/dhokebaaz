class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]


  has_many :dhokebaazs
  has_many :comments

  has_attached_file :profile_image
  validates_attachment_content_type :profile_image, :content_type => ['image/jpeg', 'image/jpg', 'image/png']
  validates_acceptance_of :tos, :allow_nil => false, :accept => true, :on => :create
  attr_accessor :login
  validates :username,
    :presence => true,
    :uniqueness => {
      :case_sensitive => false
    }

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_h).first
    end
  end
end

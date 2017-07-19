class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, omniauth_providers: [:google_oauth2, :facebook]
  validates :email, uniqueness: true


	has_and_belongs_to_many :oauth_credentials
  has_many :locations
  has_many :milestones
  has_many :trips
  has_many :transportations

  def self.from_omniauth(auth)
  	logger.debug "auth: #{auth}"
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token
      user.image_url = auth.info.image
      user.save!
    end
  end

end




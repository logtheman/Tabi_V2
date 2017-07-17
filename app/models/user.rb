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


  # def self.from_omniauth(auth)
  #     data = auth.info
  #     user = User.where(:email => data["email"]).first
  # 		logger.debug "auth: #{auth}"

  #     # Uncomment the section below if you want users to be created if they don't exist
  #     unless user
  #         # Strip out the username form email
  #         user = User.create(name: data[:info][:name],
  #         	email: data[:info][:email],
  #         	image_url: data[:info][:image],
  #           password: Devise.friendly_token[0,20],
  #           uid: data[:uid],
  #           provider: data[:provider],
  #         )
  #     end
  #     user
  # end


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

  # def self.from_omniauth(auth)
  # 	logger.debug "auth: #{auth}"
  #   where(provider: auth[:provider], uid: auth[:uid]).first_or_create do |user|
  #     user.name = auth[:info][:name]
  #     user.email = auth[:info][:email]
  #     user.image_url = auth[:info][:picture]
  #   end
  # end

end




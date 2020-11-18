class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :tweets
  has_many :room_users
  has_many :messages
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  has_many :sns_credentials
  belongs_to_active_hash :team
  belongs_to_active_hash :prefecture
  mount_uploader :image, ImageUploader

  enum sex: { 男: 0, 女: 1 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は半角英数字混合で入力してください' }

  with_options presence: true do
    validates :image
    validates :nickname, length: { maximum: 30 }
    validates :sex
    validates :birthday
    validates :team_id
    validates :prefecture_id
    validates :request, length: { maximum: 60 }
    validates :self_introduction, length: { maximum: 191 }
  end

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
      email: auth.info.email
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end

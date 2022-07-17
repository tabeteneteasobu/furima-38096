class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  #バリデーション
  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]/ }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'

  # アソシエーション
  has_many :items
  has_many :orders
  has_many :sns_credentials

  #SNSログイン
  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    # userが登録済みであるか判断
   if user.persisted?
    sns.user = user
    sns.save
  end
  { user: user, sns: sns }
  end
end

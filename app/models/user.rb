class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :birthday, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers'

  validates :first_name, :last_name, presence: true

  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze

  validates_format_of :last_name, with: NAME_REGEX, message: 'is invalid. Input full-width character'
  validates_format_of :first_name, with: NAME_REGEX, message: 'is invalid. Input full-width characters'

  validates :first_name_kana, :last_name_kana, presence: true

  KATAKANA_REGEX = /\A[ァ-ヴー]+\z/u.freeze

  validates_format_of :last_name_kana, with: KATAKANA_REGEX, message: 'is invalid. Input full-width katakana characters'
  validates_format_of :first_name_kana, with: KATAKANA_REGEX, message: 'is invalid. Input full-width katakana characters'

  has_many :orders, dependent: :destroy
end

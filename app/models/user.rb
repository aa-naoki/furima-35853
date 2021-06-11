class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze, message: 'is invalid. Include both letters and numbers' }
  validates :nickname,        presence: true
  validates :first_name,      presence: true
  validates :last_name,       presence: true
  validates :first_pseudonym, presence: true,
                              format: { with: /\A[ァ-ン]+\z/, message: 'is invalid. Input full-width katakana characters' }
  validates :last_pseudonym,  presence: true,
                              format: { with: /\A[ァ-ン]+\z/, message: 'is invalid. Input full-width katakana characters' }
  validates :birth_date,      presence: true
end

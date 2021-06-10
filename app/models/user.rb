class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :password,        format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze}
  validates :nickname,        presence: true
  validates :first_name,      presence: true
  validates :last_name,       presence: true
  validates :first_pseudonym,  format: {with: /\A[ァ-ン]+\z/}, presence: true
  validates :last_pseudonym,  presence: true, format: {with: /\A[ァ-ン]+\z/}
  validates :birth_date,      presence: true
end

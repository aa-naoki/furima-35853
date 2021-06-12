class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze, message: 'is invalid. Include both letters and numbers' }
  with_options presence: true do
    validates :nickname
    with_options format: { with:/\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'is invalid. Input full-width characters'} do
      validates :first_name
      validates :last_name
    end
    with_options format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid. Input full-width katakana characters' } do
      validates :first_pseudonym 
      validates :last_pseudonym
    end
    validates :birth_date
  end
end

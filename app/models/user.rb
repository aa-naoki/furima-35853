class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many  :purchases
  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze, message: 'が正しくありません。6文字以上の半角英数字で入力してください。' }
  with_options presence: true do
    validates :nickname
    with_options format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'が正しくありません。全角文字で入力してください。' } do
      validates :first_name
      validates :last_name
    end
    with_options format: { with: /\A[ァ-ヶー]+\z/, message: 'が正しくありません。全角カタカナで入力してください。' } do
      validates :first_pseudonym
      validates :last_pseudonym
    end
    validates :birth_date
  end
end

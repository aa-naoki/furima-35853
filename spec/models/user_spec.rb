require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき'
    it 'email,nickname,firs_name,last_name,first_pseudonym,last_pseudonym,birth_date,password,password_confirmationが存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'passwordが6文字以上であれば登録できる' do
      @user.password = 'aaaaa1'
      @user.password_confirmation = 'aaaaa1'
      expect(@user).to be_valid
    end
    it 'first_pseudonymにカタカナでの入力があれば登録できる' do
      @user.first_pseudonym = 'カタカナ'
      expect(@user).to be_valid
    end
    it 'last_pseudonymにカタカナでの入力があれば登録できる' do
      @user.last_pseudonym = 'カタカナ'
      expect(@user).to be_valid
    end

    context '新規登録できないとき'
    it 'emailが空だと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailが重複していると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが5文字以下であれば登録できない' do
      @user.password = 'aaaa1'
      @user.password_confirmation = 'aaaa1'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが半角英数字混合でないと登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid. Include both letters and numbers')
    end
    it 'passwordとpassord_confirmationが不一致だと登録できない' do
      @user.password = 'aaaaa1'
      @user.password_confirmation = 'aaaaa2'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'first_nameが空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_nameが空だと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_pseudonymが空だと登録できない' do
      @user.first_pseudonym = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First pseudonym can't be blank")
    end
    it 'first_pseudonymがカタカナでないと登録できない' do
      @user.first_pseudonym = 'katakana'
      @user.valid?
      expect(@user.errors.full_messages).to include('First pseudonym is invalid. Input full-width katakana characters')
    end
    it 'last_pseudonymが空だと登録できない' do
      @user.last_pseudonym = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last pseudonym can't be blank")
    end
    it 'last_pseudonymがカタカナでないと登録できない' do
      @user.last_pseudonym = 'katakana'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last pseudonym is invalid. Input full-width katakana characters')
    end
    it 'birth_dateが空だと登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
    end
  end
end

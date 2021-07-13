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
      expect(@user.errors.full_messages).to include('Eメールを入力してください')
    end
    it 'emailに「@」がないと登録できない' do
      @user.email = 'aaaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end
    it 'emailが重複していると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end
    it 'passwordが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードを入力してください')
    end
    it 'passwordが5文字以下であれば登録できない' do
      @user.password = 'aaaa1'
      @user.password_confirmation = 'aaaa1'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end
    it 'passwordが半角数字のみの場合は登録できない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードが正しくありません。6文字以上の半角英数字で入力してください。')
    end
    it 'passwordが半角英字のみの場合は登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードが正しくありません。6文字以上の半角英数字で入力してください。')
    end
    it 'passwordが全角の場合は登録できない' do
      @user.password = 'AAAAAA'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードが正しくありません。6文字以上の半角英数字で入力してください。')
    end
    it 'passwordとpassord_confirmationが不一致だと登録できない' do
      @user.password = 'aaaaa1'
      @user.password_confirmation = 'aaaaa2'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
    end
    it 'nicknameが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('ニックネームを入力してください')
    end
    it 'first_nameが空だと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前を入力してください')
    end
    it 'first_nameが漢字・平仮名・カタカナ以外だと登録できない' do
      @user.first_name = 'taro'
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前が正しくありません。全角文字で入力してください。')
    end
    it 'last_nameが空だと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前を入力してください')
    end
    it 'last_nameが漢字・平仮名・カタカナ以外だと登録できない' do
      @user.last_name = 'abe'
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前が正しくありません。全角文字で入力してください。')
    end
    it 'first_pseudonymが空だと登録できない' do
      @user.first_pseudonym = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前カナを入力してください')
    end
    it 'first_pseudonymがカタカナでないと登録できない' do
      @user.first_pseudonym = 'katakana'
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前カナが正しくありません。全角カタカナで入力してください。')
    end
    it 'last_pseudonymが空だと登録できない' do
      @user.last_pseudonym = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前カナを入力してください')
    end
    it 'last_pseudonymがカタカナでないと登録できない' do
      @user.last_pseudonym = 'katakana'
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前カナが正しくありません。全角カタカナで入力してください。')
    end
    it 'birth_dateが空だと登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('生年月日を入力してください')
    end
  end
end

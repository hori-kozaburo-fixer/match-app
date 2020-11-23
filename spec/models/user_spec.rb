require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it '正しく入力ができていれば登録できる' do
      expect(@user).to be_valid
    end

    it '画像が空だと登録できない' do
      @user.image = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('画像を入力してください')
    end

    it 'メールアドレスが空だと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('メールアドレスを入力してください')
    end

    it '既に登録されたemailがないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
    end

    it 'メールアドレスは@を含む必要があること' do
      @user.email = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('メールアドレスは不正な値です')
    end

    it 'パスワードが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードを入力してください')
    end

    it 'パスワードは6文字以上が必要であること' do
      @user.password = 'aaaaa'
      @user.password_confirmation = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end

    it 'passwordは半角英数字混合での入力が必須であること' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは半角英数字混合で入力してください')
    end

    it 'パスワード（確認）が空だと登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('確認用パスワードとパスワードの入力が一致しません')
    end

    it 'passwordとpassword_confirmationの値が一致が必須であること' do
      @user.password = 'abc123'
      @user.password_confirmation = '123abc'
      @user.valid?
      expect(@user.errors.full_messages).to include('確認用パスワードとパスワードの入力が一致しません')
    end

    it 'ニックネームが空だと登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('ニックネームを入力してください')
    end

    it '性別が選択されていないと登録できない' do
      @user.sex = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('性別を入力してください')
    end

    it '生年月日が選択されていないと登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('生年月日を入力してください')
    end

    it '好きなチームが選択されてないと登録できない' do
      @user.team_id = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('チームを入力してください')
    end

    it 'お住まいが選択されてないと登録できない' do
      @user.prefecture_id = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('お住まいを入力してください')
    end

    it 'どんな人を探している？が空だと登録できない' do
      @user.request = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('どんな人を探してる？を入力してください')
    end

    it 'どんな人を探している？が61文字以上だと登録できない' do
      @user.request = 'あ' * 61
      @user.valid?
      expect(@user.errors.full_messages).to include('どんな人を探してる？は60文字以内で入力してください')
    end

    it '自己紹介文が空だと登録できない' do
      @user.self_introduction = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('自己紹介文を入力してください')
    end

    it '自己紹介文が192文字以上だと登録できない' do
      @user.self_introduction = 'あ' * 192
      @user.valid?
      expect(@user.errors.full_messages).to include('自己紹介文は191文字以内で入力してください')
    end
  end
end

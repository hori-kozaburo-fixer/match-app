require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  it '正しい情報を入力すればユーザー新規登録ができて近くに住んでいる方をフォロー画面まで移動する' do
    visit root_path
    expect(page).to have_content('探しに行く')
    find('a[href="/home/seek"]').click
    expect(page).to have_content('さあ、はじめよう！')
    find('a[href="/users"]').click
    expect(page).to have_content('アカウント作成')
    visit new_user_registration_path
    page.attach_file('spec/fixtures/icon.png') do
      page.find('label[for="file_photo"]').click
    end
    fill_in 'ニックネーム', with: @user.nickname
    fill_in 'メールアドレス', with: @user.email
    fill_in 'パスワード', with: @user.password
    fill_in 'パスワード(確認)', with: @user.password_confirmation
    find('input[value="男"]').set(true)
    find('option[value="2000"]').select_option
    find('select[id="user_birthday_2i"]').find('option[value="10"]').select_option
    find('select[id="user_birthday_3i"]').find('option[value="10"]').select_option
    find('select[id="user_team_id"]').find('option[value="10"]').select_option
    find('select[id="user_prefecture_id"]').find('option[value="10"]').select_option
    fill_in 'どんな人を探してる？', with: @user.request
    fill_in '自己紹介文', with: @user.self_introduction
    expect{
      find('input[name="commit"]').click
    }.to change { User.count }.by(1)
    expect(page).to have_content('次へ')
    find('a[href="/users/follow_prefecture"]').click
    expect(page).to have_content('マイページに戻る')
    expect(page).to have_content('ログアウト')
  end

  it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
    visit root_path
    expect(page).to have_content('探しに行く')
    find('a[href="/home/seek"]').click
    expect(page).to have_content('さあ、はじめよう！')
    find('a[href="/users"]').click
    expect(page).to have_content('アカウント作成')
    visit new_user_registration_path
    page.attach_file('spec/fixtures/icon.png') do
      page.find('label[for="file_photo"]').click
    end
    fill_in 'ニックネーム', with: ""
    fill_in 'メールアドレス', with: ""
    fill_in 'パスワード', with: ""
    fill_in 'パスワード(確認)', with: ""
    find('input[value="男"]').set(false)
    find('option[value="2000"]').select_option
    find('select[id="user_birthday_2i"]').find('option[value=""]').select_option
    find('select[id="user_birthday_3i"]').find('option[value=""]').select_option
    find('select[id="user_team_id"]').find('option[value=""]').select_option
    find('select[id="user_prefecture_id"]').find('option[value=""]').select_option
    fill_in 'どんな人を探してる？', with: ""
    fill_in '自己紹介文', with: ""
    expect{
      find('input[name="commit"]').click
    }.to change { User.count }.by(0)
    expect(current_path).to eq "/users"
  end
end

  RSpec.describe 'ログイン', type: :system do
    before do
      @user = FactoryBot.create(:user)
    end
    context 'ログインができるとき' do
      it '保存されているユーザーの情報と合致すればログインができる' do
        visit root_path
        find('a[href="/home/seek"]').click
        find('a[href="/users"]').click
        expect(page).to have_content('ログイン')
        fill_in 'メールアドレス', with: @user.email
        fill_in 'パスワード', with: @user.password
        # ログインボタンを押す
        find('input[name="commit"]').click
        # トップページへ遷移することを確認す
        expect(page).to have_content('ログアウト') 
        expect(page).to have_no_content('新規登録')
        expect(page).to have_no_content('ログイン')
      end
    end
    context 'ログインができないとき' do
      it '保存されているユーザーの情報と合致しないとログインができない' do
        visit root_path
        find('a[href="/home/seek"]').click
        find('a[href="/users"]').click
        fill_in 'メールアドレス', with: ""
        fill_in 'パスワード', with: ""
        find('input[name="commit"]').click
        expect(current_path).to eq new_user_session_path
      end
    end
end

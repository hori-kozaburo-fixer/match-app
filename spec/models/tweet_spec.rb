require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe '投稿機能' do

    it '全て正しい入力をすることで登録できること' do
      expect(@tweet).to be_valid
    end
    
    it '投稿画像が空だと登録できない' do
      @tweet.image = nil
      @tweet.valid?
      expect(@tweet.errors.full_messages).to include("画像を入力してください")
    end

    it 'テーマが空だと登録できない' do
      @tweet.name = ""
      @tweet.valid?
      expect(@tweet.errors.full_messages).to include("テーマを入力してください")
    end

    it 'テーマは30文字以内でないと登録できない' do
      @tweet.name = "あ"*31
      @tweet.valid?
      expect(@tweet.errors.full_messages).to include("テーマは30文字以内で入力してください")
    end
     
    it 'ニュースが空だと登録できない' do
      @tweet.text = ""
      @tweet.valid?
      expect(@tweet.errors.full_messages).to include("ニュースを入力してください")
    end

    it 'ニュースは191文字以内でないと登録できない' do
      @tweet.text = "あ"*192
      @tweet.valid?
      expect(@tweet.errors.full_messages).to include("ニュースは191文字以内で入力してください")
    end

    it 'テームを選択しないと登録できないこと' do
      @tweet.team_id = ""
      @tweet.valid?
      expect(@tweet.errors.full_messages).to include("どのチームのニュース？を入力してください")
    end
  end
end

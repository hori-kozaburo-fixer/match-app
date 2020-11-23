require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end
  describe 'メッセージ機能' do
    it '正しく入力ができていれば登録できる' do
      expect(@message).to be_valid
    end

    it 'メッセージが空だと登録されない' do
      @message.message = ''
      @message.valid?
      # ブラウザ上では非表示
      expect(@message.errors.full_messages).to include('Messageを入力してください')
    end

    it 'メッセージが192文字以上だと登録できない' do
      @message.message = 'あ' * 192
      @message.valid?
      # ブラウザ上では非表示
      expect(@message.errors.full_messages).to include('Messageは191文字以内で入力してください')
    end
  end
end

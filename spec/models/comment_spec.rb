require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end
  describe 'コメント機能' do
    it '正しく入力ができていれば登録できる' do
      expect(@comment).to be_valid
    end
     
    it 'コメントが空だと登録されない' do
      @comment.text = ""
      @comment.valid?
      #ブラウザ上では非表示
      expect(@comment.errors.full_messages).to include("Textを入力してください")
    end

    it 'コメントが192文字以上だと登録できない' do
      @comment.text = "あ"*192
      @comment.valid?
      #ブラウザ上では非表示
      expect(@comment.errors.full_messages).to include("Textは191文字以内で入力してください")
    end
  end
end

require 'rails_helper'

RSpec.describe Register, type: :model do
  before do
    @register = FactoryBot.build(:register)
  end

  describe '全体のお知らせ保存' do
    context '全体のお知らせが投稿できる場合' do
      it 'タイトル・コメント・画像が投稿できる' do
        expect(@register).to be_valid
      end
      it '画像が空でも投稿できる' do
        @register.image = ''
        expect(@register).to be_valid
      end
    end

    context '全体のお知らせが投稿できない場合' do
      it 'タイトルが空では投稿できない' do
        @register.title = ''
        @register.valid?
        expect(@register.errors.full_messages).to include("Title can't be blank")
      end
      it 'コメントが空では投稿できない' do
        @register.general_comment = ''
        @register.valid?
        expect(@register.errors.full_messages).to include("General comment can't be blank")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @register.user = nil
        @register.valid?
        expect(@register.errors.full_messages).to include("User must exist")
      end
    end
  end
end

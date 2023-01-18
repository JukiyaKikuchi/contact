require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができるとき' do
    it '保存されているユーザーの情報と合致すればログインできる' do
    end
  end
  context 'ユーザー新規登録ができないとき' do
    it '保存されているユーザーの情報と一致しない場合はログインできない' do
    end
  end
  
end

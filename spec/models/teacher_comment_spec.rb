require 'rails_helper'

RSpec.describe TeacherComment, type: :model do
  before do
    @teacher_comment = FactoryBot.build(:teacher_comment)
  end

  describe '先生からのコメント投稿' do
    context '先生からのコメントが投稿できる' do
      it '先生の名前・コメントがあれば投稿できる' do
        expect(@teacher_comment).to be_valid
      end
    end

    context '先生からのコメントが投稿できない' do
      it '先生の名前が空だと投稿できない' do
      end
      it '先生からのコメントが空だと投稿できない' do
      end
      it 'userが紐付いていないと投稿できない' do
      end
      it 'parent_bookが紐付いていないと投稿できない' do
      end
    end
  end
end

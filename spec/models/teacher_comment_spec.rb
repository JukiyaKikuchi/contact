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
        @teacher_comment.teacher_name = ''
        @teacher_comment.valid?
        expect(@teacher_comment.errors.full_messages).to include("Teacher name can't be blank")
      end
      it '先生からのコメントが空だと投稿できない' do
        @teacher_comment.teacher_comment = ''
        @teacher_comment.valid?
        expect(@teacher_comment.errors.full_messages).to include("Teacher comment can't be blank")
      end
      it 'userが紐付いていないと投稿できない' do
        @teacher_comment.user = nil
        @teacher_comment.valid?
        expect(@teacher_comment.errors.full_messages).to include("User must exist")
      end
      it 'parent_bookが紐付いていないと投稿できない' do
        @teacher_comment.parent_book = nil
        @teacher_comment.valid?
        expect(@teacher_comment.errors.full_messages).to include("Parent book must exist")
      end
    end
  end
end

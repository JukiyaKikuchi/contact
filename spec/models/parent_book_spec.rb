require 'rails_helper'

RSpec.describe ParentBook, type: :model do
  before do
    @parent_book = FactoryBot.build(:parent_book)
  end

  describe '親の連絡帳投稿機能' do
    context '投稿できる場合' do
      it '出欠確認・記入者名・緊急連絡先・家庭での様子が記入されていれば投稿できる' do
        expect(@parent_book).to be_valid
      end
    end

    context '投稿できない場合' do
      it 'parent_nameが空では投稿できない' do
        @parent_book.parent_name = ''
        @parent_book.valid?
        expect(@parent_book.errors.full_messages).to include("Parent name can't be blank")
      end
      it 'parent_commentが空では投稿できない' do
        @parent_book.parent_comment = ''
        @parent_book.valid?
        expect(@parent_book.errors.full_messages).to include("Parent comment can't be blank")
      end
      it 'tell_numberが空では投稿できない' do
        @parent_book.tell_number = ''
        @parent_book.valid?
        expect(@parent_book.errors.full_messages).to include("Tell number can't be blank")
      end
      it 'attendance_idが1では投稿できない' do
        @parent_book.attendance_id = 1
        @parent_book.valid?
        expect(@parent_book.errors.full_messages).to include("Attendance can't be blank")
      end
      it 'tell_numberが10桁未満だと保存できない' do
        @parent_book.tell_number = '123456789'
        @parent_book.valid?
        expect(@parent_book.errors.full_messages).to include("Tell number is invalid")
      end
      it 'tell_numberが12桁以上だと保存できない' do
        @parent_book.tell_number = '123456789123'
        @parent_book.valid?
        expect(@parent_book.errors.full_messages).to include("Tell number is invalid")
      end
      it 'tell_numberに半角数値以外が含まれていては保存できない' do
        @parent_book.tell_number = '000-0000-0000'
        @parent_book.valid?
        expect(@parent_book.errors.full_messages).to include("Tell number is invalid")
      end
      it 'userが紐付いていないと保存できない' do
        @parent_book.user = nil
        @parent_book.valid?
        expect(@parent_book.errors.full_messages).to include("User must exist")
      end
    end
  end
end

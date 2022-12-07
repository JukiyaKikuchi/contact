class ParentBooksController < ApplicationController
  def index
  end

  def new
    @parent_book = ParentBook.new
  end

  def create
    @parent_book = ParentBook.new(parent_book_params)
    if @parent_book.save
      redirect_to parent_books_path
    else
      render :new
    end
  end

  private

  def parent_book_params
    params.require(:parent_book).permit(:parent_name, :parent_comment, :temperature, :poop_id, :breakfast, :attendance_id, :greeted_time_id, :greeted_name, :tell_number).merge(user_id: current_user.id)
  end

end

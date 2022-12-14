class ParentBooksController < ApplicationController
  before_action :set_parent_book, only: [:edit, :show, :update ]

  def index
    @parent_books = ParentBook.where(user_id: current_user.id).order("created_at DESC")
    if current_user.admin?
      redirect_to root_path
    end
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

  def show
    @teacher_comment = TeacherComment.new
    @teacher_comments = @parent_book.teacher_comments.includes(:user)
  end

  def destroy
    parent_book = ParentBook.find(params[:id])
    if parent_book.destroy
      redirect_to parent_books_path
    end
  end

  def edit
  end

  def update
    if @parent_book.update(parent_book_params)
      redirect_to parent_books_path
    else
      render :edit
    end
  end

  private

  def parent_book_params
    params.require(:parent_book).permit(:parent_name, :parent_comment, :temperature, :mood_id, :breakfast, :attendance_id, :greeted_time_id, :greeted_name, :tell_number).merge(user_id: current_user.id, register_id: params[:register_id])
  end

  def set_parent_book
    @parent_book = ParentBook.find(params[:id])
  end

end

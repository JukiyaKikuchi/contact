class TeacherCommentsController < ApplicationController

  def create
    @parent_book = ParentBook.find(params[:parent_book_id])
    @teacher_comment = @parent_book.teacher_comments.new(teacher_comment_params)
    @teacher_comment.save
    redirect_to parent_book_path(@parent_book)
  end

  private
  def teacher_comment_params
    params.require(:teacher_comment).permit(:teacher_comment, :teacher_name).merge(user_id: current_user.id, parent_book_id: params[:parent_book_id])
  end

end

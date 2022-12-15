class RegistersController < ApplicationController
  before_action :set_register, only: [:edit, :show, :update ]

  def index
    @user = User.where(id: current_user.id).first
    @users = User.where.not(admin: true)
    @registers = Register.all
    @parent_book = ParentBook.where(user_id: current_user.id).last
    @parent_books = ParentBook.includes(:user).order("created_at DESC")
  end

  def new
    @register = Register.new
  end

  def create
    @register = Register.new(register_params)
    if @register.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @register.update(register_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    register = Register.find(params[:id])
    if register.destroy
      redirect_to root_path
    end
  end

  private
  def register_params
    params.require(:register).permit(:title, :general_comment, :image).merge(user_id: current_user.id)
  end

  def set_register
    @register = Register.find(params[:id])
  end
end

class RegistersController < ApplicationController
  def index
    @users = User.all
    @registers = Register.all
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

  private
  def register_params
    params.require(:register).permit(:title, :general_comment, :image)
  end
end

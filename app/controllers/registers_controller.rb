class RegistersController < ApplicationController
  def index
    @users = User.all
    @registers = Register.all
  end

  def new
    @register = Register.new
  end
end

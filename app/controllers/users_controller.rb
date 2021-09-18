class UsersController < ApplicationController
  before_action :authorize_controller
  def index
    @users= User.all
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      respond_to do |format| 
        format.html { redirect_to users_index_path, notice: "User was successfully created." }
        format.json { head :no_content }
      end
    else
      respond_to do |format| 
        format.html { redirect_to users_index_path, notice: @user.errors }
        format.json { head :no_content }
        p @user.errors
      end
    end
  end

  def show

  end

  def toggle_activation
    @user = User.find(params[:id])
    if @user.update(is_active: !(@user.is_active))
      redirect_to users_index_path
    end
  end

  def authorize_controller
    if !current_user.admin?
      redirect_to root_path
    end
  end

  def user_params
    params.permit(:name, :email, :password, :password_confirmation, :label, :mobile, :address, :birthdate)
  end
  
end

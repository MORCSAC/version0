class UsersController < ApplicationController

  def new
    @user=User.new
  end

  def show
    @user=User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to '/activation'
    else
      render 'new'
    end
  end


  def user_params

    params.require(:user).permit(:first_name,:last_name, :email, :email_confirmation,:password)
  end

end

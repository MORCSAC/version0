class UsersController < ApplicationController

  def new
    @user=User.new
  end

  def show
    @user=User.find(params[:id])
  end

  def create
    @user = User.new(user_params)    # Not the final implementation!
    p @user
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end


  def user_params

    params.require(:user).permit(:first_name,:last_name, :email, :email_confirmation,:password)
  end

end

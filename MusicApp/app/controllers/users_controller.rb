class UsersController < ApplicationController
  def new
    @user = User.new
    render :new             #need view for new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages  #need to add errors to new view or template view
      render :new
    end
  end

  def show
    render :show            #need view for show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end

class UsersController < ApplicationController

  skip_before_action :logged_in?, only: [:new, :create]

  def new # => `GET /users/new` returns a new form for user registration
    @user = User.new
  end

  def create # => `POST /users`
    @user = User.new(create_user_params)

    if @user.save
      render text: 'User was sucessfully saved!'
    else
      render :new
    end
  end

  private

  def create_user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :email)
  end

end

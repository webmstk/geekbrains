class SessionsController < ApplicationController

  skip_before_action :logged_in?, only: [:new, :create]

  def new

  end

  def create
    if user = User.authenticate!(email: params[:email], password: params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'Добро пожаловать в контекст'
      redirect_to tasks_path
    else
      @error = 'Error message'
      flash.now[:alert] = I18n.t 'flash.alert.login'
      render :new
    end
  end

  def destroy

  end

end

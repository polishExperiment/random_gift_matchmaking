class HomeController < ApplicationController
  def welcome
    session.delete :user
  end

  def index
    if (current_user = User.find_by email: params[:email])
      session[:user] = current_user
      flash[:notice] = 'Witaj ' + current_user.name
    elsif session[:user]
      flash[:notice] = 'Witaj ' + session[:user]['name']
    else
      if params[:email]
        flash[:alert] = "#{params[:email]} nie może losować prezentów. Czy to na pewno poprawny adres?"
      end
      redirect_to root_path
      return
    end
    @users = User.all.order(:name)
    @current_user = User.find_by email: session[:user]['email']
  end

  def draw_lots
    drawnee = User.find params[:id]

    drawnee.has_drawn = true
    drawnee.save
    flash[:notice] = 'Właśnie wyruszył do Ciebie mail z wylosowaną osobą'
    send_mail drawnee.email, drawnee.drawn.name
    redirect_to home_path
  end

  def remind_me
    current_user = User.find_by email: session[:user]['email']
    flash[:info] = 'Właśnie wyruszył do Ciebie mail z wylosowaną osobą'
    send_mail current_user.email, current_user.drawn.name
    redirect_to index_path
  end

  def logout
    reset_session
    redirect_to root_path
  end

  private

  def send_mail email, person
    UserMailer.send_drawn(email, person).deliver_now
  end
end

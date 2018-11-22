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
        flash[:alert] = "#{params[:email]} nie może losować prezentów"
      end
      redirect_to root_path
      return
    end
    @users = User.all.order(:name)
    @current_user = User.find_by email: session[:user]['email']
  end

  def draw_lots
    drawnee = User.find params[:id]

    list_of_drawns = User.joins(:drawnee)
    list_of_users = User.where.not(id: params[:id])

    list_to_draw_from = list_of_users - list_of_drawns - [drawnee.drawnee]

    drawn = list_to_draw_from.sample(1)[0]
    drawnee.drawn = drawn
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

  private

  def send_mail email, person
    UserMailer.send_drawn(email, person).deliver_now
  end
end

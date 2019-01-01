class PagesController < ApplicationController
  def register
  end

  def register_user
    username=params[:username]
    password=params[:password]

    user=User.new
    user.name=username
    user.password=password
    user.save

    redirect_to"/login"
  end

  def login #ログインしたことある人はそのままhomeへ
  end

  def logout
    session[:id]=nil;
    redirect_to"/login"

  end

  def login_check
    username=params[:username]
    password=params[:password]

    user=User.where("name=? and password=?",
     username, password)
     user=user[0]

    if user 
      session[:id]=user.id;
      redirect_to"/home"
    else
      redirect_to"/login",flash:
      {error_message:
      "ユーザー名かパスワードが間違っています"}
    end


   
  end

  def home
  end
end

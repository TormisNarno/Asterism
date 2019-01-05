class PagesController < ApplicationController
  def top
    @boards = Board.all
  end
  
  def register
  end

  def register_user
    username = params[:username]
    password = params[:password]

    user = User.new
    user.name = username
    user.password = password
    user.save

    redirect_to "/login"
  end

  def login #ログインしたことある人はそのままhomeへ
    if session[:id]
	    redirect_to "/"
	end
  end

  def logout
    session[:id] = nil;
    redirect_to "/login"
  end
  
  def login_check
    username = params[:username]
    password = params[:password]

    user = User.where("name=? and password=?", username, password)
    user=user[0]

    if user 
      session[:id] = user.id;
      redirect_to "/"
    else
      redirect_to "/login", flash: {error_message: "ユーザー名かパスワードが間違っています"}
    end
	

  def thread_create
   if !session[:id]
	  redirect_to "/login"
   end
  end
  
  def thread_create_process
     title = params[:title]
     content = params[:content]
   
     board = Board.new
     board.title = title
     board.content = content
     board.save
   
     redirect_to "/"
  end
  
  
  def thread
   if !session[:id]
	  redirect_to "/login"
   end
  
   id = params[:id]
  
   @board = Board.find(id)
  
   if !@board
      redirect_to "/"
   end
   
   @comments = @board.comments 
   
  end
  
  def add_comment
  
    id = params[:id]
	board = Board.find(id)
	
	if !board
	   redirect_to "/"
	end
	
	user_id = session[:id]
	user = User.find(user_id)
	
	comment_text = params[:comment]
	
	comment = Comment.new
	comment.comment = comment_text
	comment.board = board
	comment.user = user;
	comment.save
	
	redirect_to "/board/"+id.to_s	
  end
  
end
end
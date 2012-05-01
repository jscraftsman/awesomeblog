class UsersController < ApplicationController

  def index
    @user = User.new                        #declared a lot in this controller!
    @loginuser = User.new                   #disobeyed the DRY 
    if session[:user_id] != nil
      redirect_to posts_path
    end
  end

  def create_user
    @user = User.new(params[:user])
    @loginuser = User.new
    if @user.save
      session[:user_id] = @user.id
      redirect_to posts_path, :notice => "Account successfully created!"
    else
      render "index"
    end
  end


  def login_user
    @loginuser = User.new(params[:user])
    @user = User.new
    user = User.authenticate(@loginuser.username, @loginuser.password)

    if user
      session[:user_id] = user.id
      redirect_to posts_path, :notice => "Login successful!"
    else
      #redirect_to index_path, :notice => "Incorrect username or password!"
      flash.now.notice = "Invalid username or password"
      render "index"
    end
  end

  def destroy
    if session[:user_id] != nil
      session[:user_id] = nil
      redirect_to index_path, :notice => "Logged out!"
    else
      redirect_to index_path
    end
  end

end

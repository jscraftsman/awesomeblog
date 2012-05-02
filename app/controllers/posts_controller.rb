class PostsController < ApplicationController
  before_filter :checker, except: [:show]
  def index
    checker
    @posts = Post.all
  end
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.user = current_user 

    if @post.save
      redirect_to posts_path, :flash => {:info => "Your post was added!"}
    else
      render "new"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    original_title = @post.title
    if @post.update_attributes(params[:post])
      redirect_to posts_path, :flash => {:info => "'#{original_title}' was updated!"}
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, :flash => {:info => "'#{@post.title}' was removed!"}
  end

  def checker
    if session[:user_id] == nil
      redirect_to index_path, :flash => {:error => "Please login!"}
    end
  end
end

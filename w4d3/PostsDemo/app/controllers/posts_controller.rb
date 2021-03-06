class PostsController < ApplicationController
  def index
    @posts = Post.all

    render :index
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new, :status => 422
    end
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])

    render :show
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy if @post
    redirect_to posts_url
  end

  private
  # def set_post
  #   @post = Post.find(params[:id])
  # end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end

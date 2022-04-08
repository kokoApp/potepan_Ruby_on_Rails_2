class PostsController < ApplicationController
  def new
    @post = Post.new  
  end

  def create
    @post = Post.new(post_params)
    if @post.save
     redirect_to post_path(@post.id)
    else
     render :new
   end
  end

  def index
    @posts = Post.all
    @posts = @posts.where('hotel LIKE ?', "%#{params[:search]}%") if params[:search].present?
    @posts = @posts.where('hotel LIKE ? OR place LIKE ? OR explantion LIKE ? OR price LIKE ?', "%#{params[:search2]}%","%#{params[:search2]}%","%#{params[:search2]}%","%#{params[:search2]}%") if params[:search2].present?
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:hotel, :place, :explantion, :price, :image).merge(user_id: current_user.id)
  end

end

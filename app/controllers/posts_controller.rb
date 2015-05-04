class PostsController < ApplicationController
    
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:category].present?
      @category = Category.find_by(name: params[:category])
      @posts = Post.where(category_id: @category.id).order('created_at DESC')
    else  
  	 @posts = Post.all.order('created_at DESC')
    end
  end

  def new
    @post = Post.new
  end

  def create
  	@post = Post.new(params_post)
  	if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(params[:post].permit(:title,:body,:image,:color))
      redirect_to @post
    else  
      render ''
    end
  end

  def show
  	@post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def params_post
  	params.require(:post).permit(:title, :body, :image,:color, :category_id)
  end
end

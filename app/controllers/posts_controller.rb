class PostsController < ApplicationController

  #basic login
  http_basic_authenticate_with name: "chin", password: '1234', expect: [:index, :show]

  def index
    @posts = Post.all

  end

  def show
      @post= Post.find(params[:id]);
  end

  def new
    @post = Post.new
  end

  def create
      # check form data
      # render plain: params[:post].inspect
      @post = Post.new(post_params)   # @post = Post.new(params[:post]) cause AttributesError: didn't define special field to post
      if(@post.save)
        redirect_to @post
      else
        render 'new'
      end
  end
  def edit
    @post= Post.find(params[:id]);
  end
  #without update will cause an error when update
  def update
    @post= Post.find(params[:id]);
    if(@post.update(post_params))
      redirect_to @post
    else
      #return to edit.html
      render 'edit'
    end
  end
  #without destroy will cause an error when delete
  def destroy
    @post= Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  #define special field - . Solved AttributesError
  private def post_params
    params.require(:post).permit(:title, :body)
  end
end

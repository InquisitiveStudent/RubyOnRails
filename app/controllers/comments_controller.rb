class CommentsController < ApplicationController

  #basic login
  http_basic_authenticate_with name: "chin", password: '1234', only: [:destroy]

  def create
    #post_id(fk): Post id
    @post= Post.find(params[:post_id])
    @comment= @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end
  def destroy
    #post_id(fk): Post id
    @post= Post.find(params[:post_id])
    @comment= @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
  private def comment_params
    params.require(:comment).permit(:username, :body)
  end
end

class CommentsController < ApplicationController
  def new
    @post = Post.find params[:post_id]
    @comment = @post.comments.build
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.approve!
    if @comment.save
      redirect_to @comment.post, notice: 'Comment was approved'
    else
      redirect_to @comment.post, notice: 'Comment was not approved'
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comments_params)
    respond_to do |format|
      format.html {
        if @comment.save
          redirect_to @post, notice: 'Thank you for your comment'
        else flash.now[:error] = "There was an error with your comment"
          render @post
        end }
      format.js
    end
  end

  def destroy
    @post = Post.find params[:post_id]
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @post
  end
  private

    def comments_params
      params.require(:comment).permit(*policy(@comment || Comment).permitted_attributes)
    end
end

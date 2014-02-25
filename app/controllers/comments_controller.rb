class CommentsController < ApplicationController
  before_action :load_commentable

  def new
    @comment = @commentable.comments.build
  end

  def update
    @comment = @commentable.comments.find params[:id]
    @comment.approve!
    if @comment.save
      redirect_to @comment.commentable, notice: 'Comment was approved'
    else
      redirect_to @comment.commentable, notice: 'Comment was not approved'
    end
  end

  def create
    @comment = @commentable.comments.create(comments_params)
    respond_to do |format|
      format.html do
          if @comment.save
            redirect_to @commentable, notice: 'Thank you for your comment it will be approved shortly'
          else flash.now[:error] = "There was an error with your comment"
            instance_variable_set("@#{@resource.singularize}".to_sym, @commentable)
            render template: "#{@resource}/show"
          end
        end
      format.js do
        unless @comment.save
          render text: @comment.errors.full_messages.join,
            status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @comment = @commentable.comments.find params[:id]
    @comment.destroy
    redirect_to @commentable
  end
  private

    def comments_params
      params.require(:comment).permit(*policy(@comment || Comment).permitted_attributes)
    end

    def load_commentable
      @resource, id = request.path.split('/')[1,2]
      @commentable = @resource.singularize.classify.constantize.find(id)
    end
end

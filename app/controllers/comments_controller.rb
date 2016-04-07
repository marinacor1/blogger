class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
    @comment.comment_id = @comment.id
  end

def create
  @comment = Comment.new(comment_params)
  @comment.article_id = params[:article_id]

  @comment.save

  redirect_to article_path(@comment.article)
end

def comment_params
  params.require(:comment).permit(:author_name, :body)
end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)

    flash.notice = "Comment '#{@comment.title}' Updated!"

    redirect_to comment_path(@comment)
  end

  def destroy
    #add flash
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_path
  end
end

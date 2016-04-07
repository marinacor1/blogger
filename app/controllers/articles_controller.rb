class ArticlesController < ApplicationController
  include ArticlesHelper
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def create
    @article = Article.new(article_params)
    @article.title = params[:article][:title]
    @article.body = params[:article][:body]
    @article.save
    redirect_to article_path(@article)
    flash.notice = "Article '#{@article.title}' Created!"
  end

  def edit
    @article = Article.find(params[:id])
    @comment = Comment.new
    @tag_list = Tag.new
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
    flash.notice = "Article '#{@article.title}' Deleted!"
  end
end

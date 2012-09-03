class CommentsController < ApplicationController
  
  before_filter :authenticate
  before_filter :authenticate_with_admin, :except => 'create'
  
  def index
    @comments = Comment.by_recent
    switch_to_admin_layout
  end
  
  # comments are shown within a page
  # new comments are created by users from within a page

  def edit
    @comment = Comment.find params[:id]
    switch_to_admin_layout
  end

  def create
    @comment = Comment.new params[:comment]
    @comment.author_id = current_user.id
    @comment.locale = I18n.locale.to_s
    @comment.status = 'pending' # translation not done with globalize3 but with locale files upon showing status to user
    if @comment.save
      redirect_to @comment.page, notice: t('comments.create.notice')
    else
      redirect_to @comment.page, warning: t('comments.create.warning')
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(params[:comment])
      redirect_to comments_path, notice: t('comments.update.notice')
    else
      render action: "edit", warning: t('comments.update.warning'), layout: 'admin'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_url, notice: t('comments.destroy.notice')
  end
  
  def accept
    @comment = Comment.find params[:id]
    @comment.status = 'accepted'
    if @comment.save
      redirect_to :back, notice: t('comments.moderation.accept.notice')
    else
      redirect_to comments_path, warning: t('comments.moderation.accept.warning')
    end
  end
  
  def block
    @comment = Comment.find params[:id]
    @comment.status = 'blocked'
    if @comment.save
      redirect_to :back, notice: t('comments.moderation.block.notice')
    else
      redirect_to comments_path, warning: t('comments.moderation.block.warning')
    end
  end
end

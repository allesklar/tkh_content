class CommentsController < ApplicationController

  before_filter :authenticate, :except => ['for_feed']
  before_filter :authenticate_with_admin, :except => ['create', 'for_feed']

  def index
    @comments = Comment.by_recent.paginate(:page => params[:page], :per_page => 50)
    switch_to_admin_layout
  end

  # comments are shown within a page
  # new comments are created by users from within a page

  def edit
    @comment = Comment.find(params[:id])
    switch_to_admin_layout
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.locale = I18n.locale.to_s
    @comment.status = 'pending' # translation not done with globalize3 but with locale files upon showing status to user
    if @comment.save
      Activity.create doer_id: current_user.id, message: "left a comment attached to: #{view_context.link_to (@comment.commentable.try(:name) || @comment.commentable.try(:title) || 'unknown'), @comment.commentable}."
      redirect_to @comment.commentable, notice: t('comments.create.notice')
    else
      flash[:warning] = t('comments.create.warning')
      redirect_to @comment.commentable
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update_attributes(comment_params)
      redirect_to comments_path, notice: t('comments.update.notice')
    else
      flash[:warning] = t('comments.update.warning')
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
      flash[:warning] = t('comments.moderation.accept.warning')
      redirect_to comments_path
    end
  end

  def block
    @comment = Comment.find params[:id]
    @comment.status = 'blocked'
    if @comment.save
      redirect_to :back, notice: t('comments.moderation.block.notice')
    else
      flash[:warning] = t('commentns.moderation.block.warning')
      redirect_to comments_path
    end
  end

  def pending
    @comments = Comment.pending.by_created.paginate(:page => params[:page], :per_page => 50)
    switch_to_admin_layout
  end

  def accepted
    @comments = Comment.accepted.by_recent.paginate(:page => params[:page], :per_page => 50)
    switch_to_admin_layout
  end

  def blocked
    @comments = Comment.blocked.by_recent.paginate(:page => params[:page], :per_page => 50)
    switch_to_admin_layout
  end

  def for_feed
    @comments = Comment.showable.for_locale(I18n.locale).by_recently_created.limit(50)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.atom
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:body, :commentable_type, :commentable_id)
    # non-accessible attributes: author_id, :status, :locale
  end

end

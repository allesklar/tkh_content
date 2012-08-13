class PagesController < ApplicationController
  
  before_filter :authenticate,            :except => 'show'
  before_filter :authenticate_with_admin, :except => 'show'
  
  def index
    @pages = Page.by_recent
    switch_to_admin_layout
  end

  def show
    @page = Page.find(params[:id])
    render layout: 'blog' if @page.for_blog?
  end

  def new
    @page = Page.new
    switch_to_admin_layout
  end

  def edit
    @page = Page.find(params[:id])
    switch_to_admin_layout
  end

  def create
    @page = Page.new(params[:page])
    @page.author_id = current_user.id
    if @page.save
      redirect_to @page, notice: t('pages.create.notice')
    else
      render action: "new", warning: t('pages.create.warning'), layout: 'admin'
    end
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      redirect_to @page, notice: t('pages.update.notice')
    else
      render action: "edit", warning: t('pages.update.warning'), layout: 'admin'
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to pages_url, notice: t('pages.destroy.notice')
  end
  
end

class PagesController < ApplicationController

  before_filter :authenticate,            :except => 'show'
  before_filter :authenticate_with_admin, :except => 'show'

  def index
    @pages = Page.by_recent.paginate(:page => params[:page], :per_page => 35)
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
    @page = Page.new(page_params)
    @page.author_id = current_user.id
    if @page.save
      redirect_to @page, notice: t('pages.create.notice')
    else
      render action: "new", flash: { error: t('pages.create.warning') }, layout: 'admin'
    end
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      redirect_to @page, notice: t('pages.update.notice')
    else
      render action: "edit", warning: t('pages.update.warning'), layout: 'admin'
    end
  end

  def destroy
    unless params[:id].to_i == 1
      @page = Page.find(params[:id])
      @page.destroy
      redirect_to pages_url, notice: t('pages.destroy.notice')
    else # one should not be able to destroy the page #1 which is the site's home page
      flash[:warning] = t('pages.destroy.root_warning')
      redirect_to ( :back || pages_url )
    end
  end

  def publish
    page = Page.find(params[:id])
    page.published_at = Time.now
    if page.save
      redirect_to pages_path, notice: t('pages.status.changed.published')
    else
      redirect_to :back, :flash => { :error => 'There was a problem while publishing this page.' }
    end
  end

  def unpublish
    page = Page.find(params[:id])
    page.published_at = nil
    if page.save
      redirect_to pages_path, notice: t('pages.status.changed.unpublished')
    else
      redirect_to :back, :flash => { :error => 'There was a problem while unpublishing this page.' }
    end
  end

  def toggle_for_blog
    page = Page.find(params[:id])
    page.for_blog? ? page.for_blog = false : page.for_blog = true
    page.save
    redirect_to pages_path notice: t('pages.status.changed.toggled')
  end

  def sort
    params[:page].each_with_index do |id, index|
      Page.update(id, menu_position: index+1)
    end
    render nothing: true
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def page_params
    params.require(:page).permit(:title, :short_title, :description, :body, :for_blog, :parent_id, :tag_list, :parent_page_title, :author_name)
  end

end

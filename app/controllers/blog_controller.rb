class BlogController < ApplicationController

  def index
    @posts = Page.for_blog.published.order('published_at desc').paginate(:page => params[:page], :per_page => 20)
    respond_to do |format|
      format.html { render :layout => 'blog' }
      format.atom
    end
  end

  def by_tag
    @tag = Tag.where('name = ?', params[:id]).first
    @posts = @tag.pages.order('published_at desc').paginate(:page => params[:page], :per_page => 20)
    render :layout => 'blog'
  end

end

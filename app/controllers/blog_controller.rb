class BlogController < ApplicationController

  def index
    @posts = Page.for_blog.published.order('published_at desc').paginate(:page => params[:page], :per_page => 20)
    respond_to do |format|
      format.html { render :layout => 'blog' }
      format.atom
    end
  end

  def by_tag
    # this little hack is necessary because globalize won't let me access the tag directly by name
    tag_id = Tag::Translation.find_by( locale: I18n.locale.to_s, name: params[:id] ).tag_id
    @tag = Tag.find(tag_id)
    @posts = @tag.pages.published.order('published_at desc').paginate(:page => params[:page], :per_page => 20)
    render :layout => 'blog'
  end

end

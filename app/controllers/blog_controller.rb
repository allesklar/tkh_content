class BlogController < ApplicationController

  def index
    @posts = Page.for_blog.published.order('published_at desc').paginate(:page => params[:page], :per_page => 20)
    respond_to do |format|
      format.html { render :layout => 'blog' }
      format.atom
    end
  end

  def by_tag
    # this is necessary to deal with instances when no posts are present for that tag
    @tag_name = params[:id]
    # this little hack is necessary because globalize won't let me access the tag directly by name
    tag = Tag::Translation.find_by( locale: I18n.locale.to_s, name: @tag_name )
    if tag.present?
      @tag = Tag.find(tag.tag_id)
      @posts = @tag.pages.published.order('published_at desc').paginate(:page => params[:page], :per_page => 20)
      render :layout => 'blog'
    else
      @posts = nil
    end
  end

end

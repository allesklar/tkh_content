atom_feed(:language => I18n.locale.to_s) do |feed|
  feed.title Setting.first.blog_name || t('blog.itself')
  feed.updated @posts.maximum(:updated_at)
  
  @posts.each do |post|
    feed.entry post, published: post.published_at do |entry|
      entry.title post.title
      entry.content post.body, type: 'html'
      entry.author do |author|
        author.name post.author.name
      end
    end
  end
end
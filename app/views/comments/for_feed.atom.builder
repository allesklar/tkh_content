atom_feed(:language => I18n.locale.to_s) do |feed|
  feed.title "#{Setting.first.site_name}. #{t('activerecord.models.comments').capitalize}"
  feed.updated @comments.maximum(:updated_at)
  feed.language I18n.locale.to_s
  
  @comments.each do |comment|
    feed.entry comment, url: page_url(comment.page, anchor: "comment-#{comment.id}") do |entry|
      entry.title truncate comment.body, length: 30, separator: ' ...'
      entry.url page_url(comment.page, anchor: "comment-#{comment.id}")
      entry.content comment.body
      entry.author do |author|
        author.name comment.author.name
      end
    end
  end
end
xml.instruct! :xml, version: "1.0" 
xml.rss version: "2.0" do
  xml.channel do
    xml.title Setting.first.try(:blog_name)
    xml.description Setting.first.try(:blog_tagline)
    xml.link blog_url

    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.description post.body
        xml.pubDate post.published_at.to_s(:rfc822)
        xml.link page_url(post)
        xml.guid page_url(post)
      end
    end
  end
end
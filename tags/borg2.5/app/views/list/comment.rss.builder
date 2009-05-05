xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Comments on " + strip_tags(borg(:title))
    xml.description borg(:tagline)
    xml.link root_url

    for comment in @comments
      xml.item do
        xml.title "Comment by " + comment.h(:author, " an anonymous coward") + " on \"" + ( comment.page.title || comment.page.path.join('/')) + "\""
        xml.author author_rss(comment)
        xml.pubDate last_modified_rss(comment)
        xml.description textile(comment.titleless_content)
        xml.link page_url({ :path => comment.page.path })
      end
    end
  end
end
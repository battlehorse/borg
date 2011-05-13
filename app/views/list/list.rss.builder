xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title strip_tags(borg(:title))
    xml.description borg(:tagline)
    xml.link root_url

    for page in @pages
      xml.item do
        xml.title page.title || "No title"
        xml.author author_rss(page)
        xml.pubDate last_modified_rss(page)
        xml.description textile(page.titleless_content)
        xml.link page_url({ :path => page.path })
        page.h(:tags).each { |tag| xml.category tag } unless page.h(:tags).nil?
      end
    end
  end
end
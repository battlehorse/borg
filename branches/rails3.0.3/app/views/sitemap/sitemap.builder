xml.instruct!
xml.urlset(:xmlns => "http://www.sitemaps.org/schemas/sitemap/0.9") {
  @sitemap_urls.each_pair do |sitemap_url, attrs|
    xml.url {
      xml.loc sitemap_url
      xml.lastmod attrs[:lastmod] if attrs[:lastmod]
      xml.priority attrs[:priority] if attrs[:priority]
    }
  end
}
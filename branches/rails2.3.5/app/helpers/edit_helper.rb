module EditHelper
  
  def raw_content(page)
    raw_content = ""
    page.headers.each_pair do |k,v| 
      v = ([] << v).flatten.join(',')
      raw_content << '# ' << "#{k} : #{v}\n"
    end
    raw_content << page.content << "\n"
    
    return raw_content.blank? ? nil : raw_content
  end
  
  def boilerplate(kind)
    if kind == 'wave'
      wave_boilerplate
    else
      # assume kind == 'page'
      page_boilerplate
    end
  end
  
  def wave_boilerplate
    # Ugly, but needed to avoid whitespaces...
    return <<-EOF
#{headers_boilerplate(true)}

h1. Your Title here

!(articleimg float-right)#google-wave-logo.png#! Lorem ipsum dolor sit amet, consectetur adipisicing elit...
EOF
  end
  
  def page_boilerplate
    # Ugly, but needed to avoid whitespaces...
    return <<-EOF
#{headers_boilerplate(false)}

h1. Your Title here

!(articleimg float-right)http://rubyonrails.org/images/rails.png! Lorem ipsum dolor sit amet, consectetur adipisicing elit...
EOF
  end
  
  def headers_boilerplate(is_wave)
    headers = ""
    headers << "# author : #{session[:user_id] ? session[:user_id].to_author_hash['author'] : 'Name Surname'}\n"
    headers << "# author_mail : #{session[:user_id] ? session[:user_id].to_author_hash['author_mail'] : 'address at foo dot com'}\n"
    headers << "# tags : #{is_wave ? 'wave, ' : ''}one, two, three\n"
    headers << "# date : #{Time.now.strftime('%b %d %Y')}\n"
    headers << "# wave : googlewave.com!wave_id\n"
    return headers
  end
end
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
  
  def boilerplate
    # Ugly, but needed to avoid whitespaces...
    return <<-EOF
# author : #{session[:user_id] ? session[:user_id].to_author_hash['author'] : 'Name Surname'}
# author_mail : #{session[:user_id] ? session[:user_id].to_author_hash['author_mail'] : 'address at foo dot com'}
# tags : one, two, three
# date : #{Time.now.strftime('%b %d %Y')}

h1. Your Title here

!(articleimg float-right)http://rubyonrails.org/images/rails.png! Lorem ipsum dolor sit amet, consectetur adipisicing elit...
    EOF
  end
end
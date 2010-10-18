# Compile with
# ragel -R redcloth.rl
#
class BorgRedCloth
  attr_reader :links, :cliparts

  def initialize
    @links = []
    @cliparts = []

    %%{
      machine borg_parser;

      page_url = "[" (any - "]")+ "]";
      list_url = "{" (any - "}")+ "}";
      blog_url = "<" (digit{4} ("/" [01] digit ("/" [0-3] digit)?)?)? ">";
      tag_url = "tags";
      attach_url = "#" (any - "#")+ "#";
      link = '"' (any - '"')+ '":' (page_url|list_url|blog_url|tag_url|attach_url) > {
        @mark_link = p
      };
      clipart = "__" [A-Z\-]+ "__";

      codeblock = "<code>" any+ "</code>";
      preblock = "<pre>" any+ "</pre>";
      codeinline = "@" (any - space)+ :> "@";
      
      main := |*
        codeblock {};
        preblock {};
        codeinline {};
        link {
          @links << {
            :start => @mark_link,
            :end => te-1,
            :text => source[@mark_link..(te-1)]
          }
        };
        clipart { 
          @cliparts << {
            :start => ts,
            :end => te-1,
            :text => source[ts..(te-1)]
          }
        };
        any {};
      *|;
    }%%
    %% write data;
  end
  
  def parse(data)
    source = data
    data = data.unpack("c*") if data.is_a?(String)
    eof = data.length

    %% write init;
    %% write exec;
  end

end
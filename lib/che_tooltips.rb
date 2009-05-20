module Che
  
  module TooltipsRenderer   
    
    class Tooltip    
      
      def initialize(aim_dom_id, content, options)
        @aim_dom_id = aim_dom_id
        @content = javascript_escaping content
        @options = options_parse options
      end
      
      def render
        "new Tip('" + @aim_dom_id + "', '" + @content + "', #{@options});" + br
      end
      
      private
      
        def javascript_escaping(content)
          content.to_s.gsub(/\n/,' ').gsub(/'/,"\\\\'")
        end
        
        def options_parse(options)
          '{' + options.map{|key, value| "#{key}: #{casing_value value}"}.sort.join(', ') + '}'
        end
        
        def casing_value(value)
          case value
            when Hash then options_parse(value)
            when String then "'#{value}'"          
            else value
          end
        end
        
        def br
          "\n"
        end
    end
    
    def tooltip_tag(aim_dom_id, options = {}, &block)
      content_for(:tips){Tooltip.new(aim_dom_id, capture(&block), options).render} if block_given?
    end
    
    def tooltips_include_tag(&block)
      if block_given?
        concat render_files unless already_used?
        concat "<script type=\"text/javascript\">"
        concat "document.observe('dom:loaded', function() {"
        yield || ""
        concat "});"
        concat "</script>"
      end
    end
    
    private
    
      def br
        "\n"
      end
      
      def render_files
        @tooltips_included = true
        javascript_include_tag('prototip') + br +
        javascript_include_tag('scriptaculous_fixed') + br +
        stylesheet_link_tag('prototip', :media => 'all')
      end
      
      def already_used?
        @tooltips_included == true
      end
    
  end
end
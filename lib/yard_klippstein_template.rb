# ruby encoding: utf-8
YARD::Templates::Engine.register_template_path File.dirname(__FILE__) + '/../templates'


# patch rdoc markup for table-like definition lists
require 'rdoc'
require 'rdoc/markup'
require 'rdoc/markup/to_html'
 
class RDoc::Markup::ToHtml

  ##
  # Returns the HTML tag for +list_type+, possible using a label from
  # +list_item+

  def list_item_start(list_item, list_type)
    case list_type
    when :BULLET, :LALPHA, :NUMBER, :UALPHA then
      "<li>"
    when :LABEL, :NOTE then
      "<div class=""rdoc-dl-row""> <dt>#{to_html list_item.label}\n<dd>"
    else
      raise RDoc::Error, "Invalid list type: #{list_type.inspect}"
    end
  end

  ##
  # Returns the HTML end-tag for +list_type+

  def list_end_for(list_type)
    case list_type
    when :BULLET, :LALPHA, :NUMBER, :UALPHA then
      "</li>"
    when :LABEL, :NOTE then
      "</dd> </div>"
    else
      raise RDoc::Error, "Invalid list type: #{list_type.inspect}"
    end
  end

end

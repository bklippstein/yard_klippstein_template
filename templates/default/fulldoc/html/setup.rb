


# @return [String] HTML output of the classes to be displayed in the
#    full_list_class template.
def class_list(root = Registry.root)
  out = ""
  children = run_verifier(root.children)
  if root == Registry.root
    children += @items.select {|o| o.namespace.is_a?(CodeObjects::Proxy) }
  end
  children.reject {|c| c.nil? }.sort_by {|child| child.path }.map do |child|
      
    if child.is_a?(CodeObjects::NamespaceObject)
      next  if  (child.is_a?(CodeObjects::ClassObject) && child.superclass.name.to_s == 'UnitTest')    # Klippstein
      name = child.namespace.is_a?(CodeObjects::Proxy) ? child.path : child.name
      has_children = run_verifier(child.children).any? {|o| o.is_a?(CodeObjects::NamespaceObject) }
      out << "<li>"
      out << "<a class='toggle'></a> " if has_children
      out << linkify(child, name)
      out << " &lt; #{child.superclass.name}" if child.is_a?(CodeObjects::ClassObject) && child.superclass
      out << "<small class='search_info'>"
      if !child.namespace || child.namespace.root?
        out << "Top Level Namespace"
      else
        out << child.namespace.path
      end
      out << "</small>"
      out << "</li>"
      out << "<ul>#{class_list(child)}</ul>" if has_children
    end
  end
  out
end

def init
  sections :header, :box_info, :children, :pre_docstring, T('docstring'), 
    :attribute_summary, [:item_summary], :inherited_attributes,
    :method_summary, [:item_summary], :inherited_methods,
    :constant_summary, [T('docstring')], :inherited_constants,    
    :methodmissing, [T('method_details')],
    :attribute_details, [T('method_details')],
    :method_details_list, [T('method_details')]
end

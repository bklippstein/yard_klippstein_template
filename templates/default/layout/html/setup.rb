
 def stylesheets
   # Load the existing stylesheets while appending the custom one
   super + %w(css/klippstein.css)
 end

 def javascripts
   # Load the existing javascripts while appending the custom one
   super + %w(js/klippstein.js)
 end
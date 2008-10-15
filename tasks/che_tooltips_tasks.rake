namespace "tooltips" do
  desc "Plugin installer"
  task :install => [:stylesheets, :javascripts, :images]  do
    puts " * plugin tooltips installed successfull"
  end
  
  desc "Copying stylesheets"
  task :stylesheets do
    puts " * copying stylesheet \"prototip.css to\" \"/public/stylesheets\".."
    css_dir, css_file = File.join(RAILS_ROOT,  '/public/stylesheets'), 
      File.join(RAILS_ROOT,  '/vendor/plugins/tooltips/stylesheets/prototip.css')
    FileUtils.mkdir_p(css_dir)
    FileUtils.copy(css_file, css_dir) unless File.exist?(File.join(RAILS_ROOT,  '/public/stylesheets/prototip.css'))
  end
  
  desc "Copying javascripts"
  task :javascripts do
    puts " * copying javascript \"prototip.js to\" \"/public/javascripts\".."
    js_dir, js_file = File.join(RAILS_ROOT,  '/public/javascripts'), 
      File.join(RAILS_ROOT,  '/vendor/plugins/tooltips/javascripts/prototip.js')
    FileUtils.mkdir_p(js_dir)
    FileUtils.copy(js_file, js_dir) unless File.exist?(File.join(RAILS_ROOT,  '/public/javascripts/prototip.js'))
  end
  
  desc "Copying images"
  task :images do
    puts " * copying images to \"/public/images/\".."
    i_dir, i_file = File.join(RAILS_ROOT,  '/public/images'), 
      File.join(RAILS_ROOT,  '/vendor/plugins/tooltips/images/prototip')
    FileUtils.mkdir_p(i_dir)
    FileUtils.copy(i_file, i_dir)
  end
end
Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components')

# We don't want the default of everything that isn't js or css, because it pulls too many things in
# Rails.application.config.assets.precompile.shift

Rails.application.config.assets.precompile << Proc.new do |path|
  if path =~ /\.(css|js)\z/
    if path.in? ["way.js/demo.js"]
      puts "mow"
      false
    else
      full_path = Rails.application.assets.resolve(path).to_path
      app_assets_path = Rails.root.join('app', 'assets').to_path
      if full_path.starts_with? app_assets_path
        puts ">>>>"+full_path
        true
      else
        puts "skipping "+full_path
      end
    end
  else
    false
  end
end

# Explicitly register the extensions we are interested in compiling
Rails.application.config.assets.precompile.push(Proc.new do |path|
  File.extname(path).in? [
    '.html', '.erb', '.haml',                 # Templates
    '.png',  '.gif', '.jpg', '.jpeg', '.svg', # Images
    '.eot',  '.otf', '.svc', '.woff', '.ttf', # Fonts
  ]
end)

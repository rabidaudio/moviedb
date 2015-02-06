Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components')

# We don't want the default of everything that isn't js or css, because it pulls too many things in
Rails.application.config.assets.precompile.shift

# Explicitly register the extensions we are interested in compiling
Rails.application.config.assets.precompile.push(Proc.new do |path|
  File.extname(path).in? [
    '.html', '.erb', '.haml',                 # Templates
    '.png',  '.gif', '.jpg', '.jpeg', '.svg', # Images
    '.eot',  '.otf', '.svc', '.woff', '.ttf', # Fonts
  ]
end)
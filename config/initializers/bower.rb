BowerRails.configure do |bower_rails|
  bower_rails.resolve_before_precompile = true
end

Rails.application.config.assets.paths << Rails.root.join('vendor', 'assets', 'bower_components')
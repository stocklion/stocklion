# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w( Chart.bundle.min.js )
Rails.application.config.assets.precompile += %w( utils.js )
Rails.application.config.assets.precompile += %w( typed.js )
Rails.application.config.assets.precompile += %w( bootstrap.min.css )
Rails.application.config.assets.precompile += %w( bootstrap.css )
Rails.application.config.assets.precompile += %w( modern-business.css )
Rails.application.config.assets.precompile += %w( stock-selection.css )
Rails.application.config.assets.precompile += %w( dragula.min.css )
Rails.application.config.assets.precompile += %w( dragula-in-use.css )
Rails.application.config.assets.precompile += %w( tipped.js )
Rails.application.config.assets.precompile += %w( tipped.css )

Rails.application.config.assets.precompile += %w( dragula.js )
Rails.application.config.assets.precompile += %w( dragulaInUse.js)

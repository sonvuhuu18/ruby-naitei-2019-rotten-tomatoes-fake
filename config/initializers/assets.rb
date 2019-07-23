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
Rails.application.config.assets.precompile += %w( bootstrap.min.css font-awesome.min.css icofont.css magnific-popup.css
    meanmenu.min.css plugins.css default.css menu.css slider.css style.css responsive.css modernizr-2.8.3.min.js shortcodes.css
    jquery-1.12.4.min.js popper.js bootstrap.min.js jquery.ajaxchimp.min.js plugins.js main.js custom.css )



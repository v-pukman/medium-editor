require 'medium-editor/helpers'

namespace :medium_editor do
  include MediumEditor::Helpers

  task :update do
    puts `bower install medium-editor`

    copy_asset "bower_components/medium-editor/dist/css/medium-editor.min.css", "medium-editor/medium-editor.min.css"

    copy_asset "bower_components/medium-editor/dist/css/themes/beagle.min.css", "medium-editor/themes/beagle.min.css"
    copy_asset "bower_components/medium-editor/dist/css/themes/bootstrap.min.css", "medium-editor/themes/bootstrap.min.css"
    copy_asset "bower_components/medium-editor/dist/css/themes/default.min.css", "medium-editor/themes/default.min.css"
    copy_asset "bower_components/medium-editor/dist/css/themes/flat.min.css", "medium-editor/themes/flat.min.css"
    copy_asset "bower_components/medium-editor/dist/css/themes/mani.min.css", "medium-editor/themes/mani.min.css"
    copy_asset "bower_components/medium-editor/dist/css/themes/roman.min.css", "medium-editor/themes/roman.min.css"
    copy_asset "bower_components/medium-editor/dist/css/themes/tim.min.css", "medium-editor/themes/tim.min.css"

    copy_asset "bower_components/medium-editor/dist/js/medium-editor.min.js", "medium-editor/medium-editor.min.js"
  end

  task :install_plugins do
    js = []
    css = []
    MediumEditor::Plugin::Base.loaded_plugins.each do |plugin|
      puts "add #{plugin}"
      js += plugin.javascripts
      css += plugin.stylesheets
    end
    require_plugin_assets js, css
  end

  task :uninstall_plugins do
    clear_plugin_assets
  end
end

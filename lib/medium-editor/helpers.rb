module MediumEditor
  module Helpers
    def copy_asset filename, rel_filename=nil
      rel_filename = File.basename(filename) unless rel_filename
      folder = rel_filename.downcase.include?('.css') ? 'stylesheets' : 'javascripts'
      puts "vendoring " + rel_filename + " to " + folder
      FileUtils::mkdir_p "vendor/assets/#{folder}/#{File.dirname(rel_filename)}"
      FileUtils.cp filename, File.join("vendor/assets/#{folder}", rel_filename)
    end

    def require_plugin_assets js, css
      File.open("vendor/assets/javascripts/medium-editor-plugins.js", "w") do |file|
        js.each {|path| file.puts "//= require #{path}" }
      end
      File.open("vendor/assets/stylesheets/medium-editor-plugins.css", "w") do |file|
        css.each {|path| file.puts "/*= require #{path} */" }
      end

      p File.read "vendor/assets/javascripts/medium-editor-plugins.js"
      p File.read "vendor/assets/stylesheets/medium-editor-plugins.css"
    end

    def clear_plugin_assets
      File.write "vendor/assets/javascripts/medium-editor-plugins.js", ""
      File.write "vendor/assets/javascripts/medium-editor-plugins.css", ""
    end
  end
end

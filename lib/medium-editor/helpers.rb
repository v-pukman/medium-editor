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
      File.open(PLUGINS_JS_FILE, "w") do |file|
        js.each {|path| file.puts "//= require #{path}" }
      end
      File.open(PLUGINS_CSS_FILE, "w") do |file|
        css.each {|path| file.puts "/*= require #{path} */" }
      end

      p File.read PLUGINS_JS_FILE
      p File.read PLUGINS_CSS_FILE
    end

    def clear_plugin_assets
      File.delete PLUGINS_JS_FILE if File.exist?(PLUGINS_JS_FILE)
      File.delete PLUGINS_CSS_FILE if File.exist?(PLUGINS_CSS_FILE)
    end
  end
end

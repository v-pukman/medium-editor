module MediumEditor
  module Plugin
    class Base
      def self.loaded_plugins
        MediumEditor::Plugin::Base.descendants
      end

      def self.javascripts; []; end
      def self.stylesheets; []; end
    end
  end
end

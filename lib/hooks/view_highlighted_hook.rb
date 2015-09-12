module Highlightjs
  module Hooks
    class ViewHighlightedHook < Redmine::Hook::ViewListener
      def view_layouts_base_html_head(context={})
        setting = Setting.plugin_redmine_highlightjs[:theme]
        setting = 'monokai_sublime' if setting.nil? || setting.empty?
        return stylesheet_link_tag("themes/#{setting}.css", :plugin => "redmine_highlightjs", :media => "screen") +
#          stylesheet_link_tag("numberlines.css", :plugin => "redmine_highlightjs", :media => "screen") +
          stylesheet_link_tag("fixes.css", :plugin => "redmine_highlightjs", :media => "screen") +
          javascript_include_tag('highlight.pack.min.js', :plugin => 'redmine_highlightjs') +
#          javascript_include_tag('numberlines.js', :plugin => 'redmine_highlightjs') +
          javascript_include_tag('loader.js', :plugin => 'redmine_highlightjs')
      end
    end
  end
end


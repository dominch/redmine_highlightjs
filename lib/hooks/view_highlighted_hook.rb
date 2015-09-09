module Highlightjs
  module Hooks
    class ViewHighlightedHook < Redmine::Hook::ViewListener
      def view_layouts_base_html_head(context={})
        setting = Setting.plugin_redmine_highlightjs[:theme]
        return stylesheet_link_tag("#{setting}.css", :plugin => "redmine_highlightjs", :media => "screen") +
        stylesheet_link_tag("fixes.css", :plugin => "redmine_highlightjs", :media => "screen") +
        javascript_include_tag('highlight.pack.min.js', :plugin => 'redmine_highlightjs') +
        javascript_include_tag('loader.js', :plugin => 'redmine_highlightjs')
      end
    end
  end
end


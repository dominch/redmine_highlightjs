require 'redmine'

require_dependency 'hooks/view_highlighted_hook'

Redmine::Plugin.register :redmine_highlightjs do
  name 'Syntax highlighting with highlightjs'
  author 'dominik chmaj'
  description 'Adds much better syntax highlighting with autodetection'
  version '0.1.0'
  settings :default => {'theme' => 'monokai_sublime'}, :partial => 'settings/highlightjs_settings'
end

ActionDispatch::Callbacks.to_prepare do
  require_dependency 'highlightjs_highlighting'
  Redmine::SyntaxHighlighting.highlighter = 'Highlightjs'
end

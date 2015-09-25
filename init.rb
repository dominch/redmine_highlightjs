require 'redmine'
require 'code_theme_my_account_hooks'
require 'code_theme_user_patch'
require 'code_theme_themes_patch'

require_dependency 'hooks/view_highlighted_hook'

Redmine::Plugin.register :redmine_highlightjs do
  name 'Syntax highlighting with highlightjs'
  author 'Dominik Chmaj'
  url 'https://github.com/dominch/redmine_highlightjs'
  author_url 'http://dominik.net.pl/'
  description 'Adds much better syntax highlighting with autodetection'
  version '1.0.3'
  settings :default => {'theme' => 'monokai_sublime'}, :partial => 'settings/highlightjs_settings'
  requires_redmine :version_or_higher => '2.1.0'
end

ActionDispatch::Callbacks.to_prepare do
  require_dependency 'highlightjs_highlighting'
end

Rails.configuration.to_prepare do
  require_dependency 'user_preference'
  unless UserPreference.included_modules.include? CodeThemeUserPreferencePatch
    UserPreference.send(:include, CodeThemeUserPreferencePatch) 
  end 
end

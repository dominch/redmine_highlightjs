module Highlightjs
  module Hooks
    class ViewHighlightedHook < Redmine::Hook::ViewListener
      def view_layouts_base_html_head(context={})

        request = context[:request].env['HTTP_USER_AGENT']
        user_agent = UserAgent.parse(request)
        
        if SupportedBrowsers.detect { |browser| user_agent >= browser }
          Rails.logger.info "redmine_highlightjs2: supported browser: #{user_agent}"
          begin
            Redmine::SyntaxHighlighting.highlighter = 'HighlightJsSyntaxHighlighting'
          rescue
            Rails.logger.info "redmine_highlightjs2: cannot turn off CodeRay"
          end
          setting = User.current.preference.code_theme if !Setting.plugin_redmine_highlightjs[:allow_redefine].nil?
          setting = Setting.plugin_redmine_highlightjs[:theme] if setting.nil? || setting.empty? || setting == CodeThemeUserSetting::DEFAULT_CODE_THEME
          setting = 'monokai_sublime' if setting.nil? || setting.empty?
          return stylesheet_link_tag("themes/#{setting}.css", :plugin => "redmine_highlightjs", :media => "screen") +
          stylesheet_link_tag("fixes.css", :plugin => "redmine_highlightjs", :media => "screen") +
          javascript_include_tag('highlight.pack.min.js', :plugin => 'redmine_highlightjs') +
          javascript_include_tag('loader.js', :plugin => 'redmine_highlightjs')
        else
          Rails.logger.info "redmine_highlightjs2: *NOT* supported browser: #{user_agent}"
          return '';
        end

      end
    end

    private

    Browser = Struct.new(:browser, :version)

    SupportedBrowsers = [
      Browser.new('Safari', '2'),
      Browser.new('Firefox', '3'),
      Browser.new('Chrome', '10'),
      Browser.new('Internet Explorer', '9')
    ]

  end
end


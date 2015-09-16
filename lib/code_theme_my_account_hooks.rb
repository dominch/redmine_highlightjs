class CodeThemeMyAccountHooks < Redmine::Hook::ViewListener
  render_on :view_my_account, :partial => 'settings/code_theme_form', :multipart => true
end

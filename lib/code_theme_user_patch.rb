module CodeThemeUserPreferencePatch
  def self.included(base) 
    base.send(:include, UserPreferenceInstanceMethodsForCodeTheme) 
    base.class_eval do
      unloadable
    end
  end
end

module UserPreferenceInstanceMethodsForCodeTheme
  
  def code_theme
    code_theme_setting = CodeThemeUserSetting.find_code_theme_by_user_id(user.id)
    return nil unless code_theme_setting
    code_theme_setting.code_theme
  end

  def code_theme=(name)
    code_theme_setting = CodeThemeUserSetting.find_or_create_code_theme_by_user_id(user.id)
    code_theme_setting.code_theme = name
    code_theme_setting.save!
  end
end

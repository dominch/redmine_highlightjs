class CodeThemeUserSetting < ActiveRecord::Base
  unloadable
  belongs_to :user
  validates_presence_of :user

  DEFAULT_CODE_THEME = '__default_code_theme__'
  CODE_THEMES = {
    'agate' => 'agate',
    'androidstudio' => 'androidstudio',
    'arta' => 'arta',
    'ascetic' => 'ascetic',
    'atelier cave (light)' => 'atelier-cave.light',
    'atelier cave (dark)' => 'atelier-cave.dark',
    'atelier dune (light)' => 'atelier-dune.light',
    'atelier dune (dark)' => 'atelier-dune.dark',
    'atelier estuary (light)' => 'atelier-estuary.light',
    'atelier estuary (dark)' => 'atelier-estuary.dark',
    'atelier forest (light)' => 'atelier-forest.light',
    'atelier forest (dark)' => 'atelier-forest.dark',
    'atelier heath (light)' => 'atelier-heath.light',
    'atelier heath (dark)' => 'atelier-heath.dark',
    'atelier lakeside (light)' => 'atelier-lakeside.light',
    'atelier lakeside (dark)' => 'atelier-lakeside.dark',
    'atelier plateau (light)' => 'atelier-plateau.light',
    'atelier plateau (dark)' => 'atelier-plateau.dark',
    'atelier savanna (light)' => 'atelier-savanna.light',
    'atelier savanna (dark)' => 'atelier-savanna.dark',
    'atelier seaside (light)' => 'atelier-seaside.light',
    'atelier seaside (dark)' => 'atelier-seaside.dark',
    'atelier sulphurpool (light)' => 'atelier-sulphurpool.light',
    'atelier sulphurpool (dark)' => 'atelier-sulphurpool.dark',
    'brown paper' => 'brown_paper',
    'codepen embed' => 'codepen-embed',
    'color brewer' => 'color-brewer',
    'dark' => 'dark',
    'darkula' => 'darkula',
    'default' => 'default',
    'docco' => 'docco',
    'far' => 'far',
    'foundation' => 'foundation',
    'github' => 'github',
    'github gist' => 'github-gist',
    'googlecode' => 'googlecode',
    'grayscale' => 'grayscale',
    'hopscotch' => 'hopscotch',
    'hybrid' => 'hybrid',
    'idea' => 'idea',
    'ir_black' => 'ir_black',
    'kimbie (light)' => 'kimbie.light',
    'kimbie (dark)' => 'kimbie.dark',
    'magula' => 'magula',
    'mono-blue' => 'mono-blue',
    'monokai' => 'monokai',
    'monokai sublime' => 'monokai_sublime',
    'obsidian' => 'obsidian',
    'paraiso (light)' => 'paraiso.light',
    'paraiso (dark)' => 'paraiso.dark',
    'pojoaque' => 'pojoaque',
    'pojoaque.jpg' => 'pojoaque.jpg',
    'railscasts' => 'railscasts',
    'rainbow' => 'rainbow',
    'school_book' => 'school_book',
    'solarized (light)' => 'solarized_light',
    'solarized (dark)' => 'solarized_dark',
    'sunburst' => 'sunburst',
    'tomorrow night' => 'tomorrow-night',
    'tomorrow night (blue)' => 'tomorrow-night-blue',
    'tomorrow night (bright)' => 'tomorrow-night-bright',
    'tomorrow night (eighties)' => 'tomorrow-night-eighties',
    'tomorrow' => 'tomorrow',
    'vs' => 'vs',
    'xcode' => 'xcode',
    'zenburn' => 'zenburn'
  }

  def self.find_code_theme_by_user_id(user_id)
    begin
      CodeThemeUserSetting.find(:first, :conditions => ['user_id = ?', user_id])
    rescue ActiveRecord::RecordNotFound
      CodeThemeUserSetting.where(user_id: user_id).take
    end
  end

  def self.find_or_create_code_theme_by_user_id(user_id)
    code_theme = find_code_theme_by_user_id(user_id)
    unless code_theme
      code_theme = CodeThemeUserSetting.new
      code_theme.user_id = user_id
    end
    return code_theme
  end

  def code_theme_name
    return '' if code_theme == DEFAULT_CODE_THEME
    code_theme
  end
end

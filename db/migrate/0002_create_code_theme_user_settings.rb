class CreateCodeThemeUserSettings < ActiveRecord::Migration
  def self.up
    create_table :code_theme_user_settings do |t|
      t.column :user_id, :integer
      t.column :code_theme, :string
      t.column :updated_at, :timestamp
    end
  end

  def self.down
    drop_table :code_theme_user_settings
  end
end

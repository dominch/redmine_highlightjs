module HighlightjsHighlighting
  class << self
    def highlight_by_filename(text, filename)
      Rails.logger.info "redmine_highlightjs: syntax by filename #{filename}"
    end

    def highlight_by_language(text, language)
      Rails.logger.info "redmine_highlightjs: syntax #{language}"
    end
  end
end

module ApplicationHelper
  # Return a title on a per-page basis.
  def title
    base_title = "Upload and Rate MP3s App"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end

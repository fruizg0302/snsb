module ApplicationHelper
# Returns the full title on a per-page basis.

  def javascript(*files)
    content_for(:header) { javascript_include_tag(*files) }
  end

  def stylesheet(*files)
    content_for(:header) { stylesheet_link_tag(*files) }
  end

  def full_title(page_title)
  base_title = "Metas Semana Nacional de Salud Bucal"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
  end
end
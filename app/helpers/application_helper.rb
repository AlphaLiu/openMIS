#encoding:utf-8
module ApplicationHelper
	# Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "企业进销存管理系统"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def link_to_menu(name, *args)
    link_to(*args) do
      content = content_tag(:i, '', class: 'icon-chevron-right')
      content << "#{name}"
      content
    end
  end
end

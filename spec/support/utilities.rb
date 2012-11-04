#encoding:utf-8
def full_title(page_title)
	base_title = "企业进销存管理系统" 
	if page_title.empty?
		base_title
	else
		"#{base_title} | #{page_title}" 
	end
end
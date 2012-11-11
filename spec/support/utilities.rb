#encoding:utf-8
def full_title(page_title)
	base_title = "企业进销存管理系统" 
	if page_title.empty?
		base_title
	else
		"#{base_title} | #{page_title}" 
	end
end

def sign_in(user)
  visit signin_path
  fill_in "用户名",    with: user.name
  fill_in "密码", with: user.password
  click_button "登录"
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end

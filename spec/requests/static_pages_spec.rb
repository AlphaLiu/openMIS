#encoding:utf-8
require 'spec_helper'

describe "StaticPages" do

	subject{ page }

	describe "Home page" do

		before { visit root_path } 

		it { should have_selector('h1', :text => '企业进销存管理系统') }
		it { should have_selector('title', :text => "企业进销存管理系统") }
		it { should_not have_selector('title', :text => '| 首页') }
	end
end

#encoding:utf-8
require 'spec_helper'

describe "StaticPages" do

	describe "Home page" do

    it "should have the h1 '企业进销存管理系统'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => '企业进销存管理系统')
    end

    it "should have the base title" do
      visit '/static_pages/home'
      page.should have_selector('title',
                        :text => "企业进销存管理系统")
    end

    it "should not have a custom page title" do
      visit '/static_pages/home'
      page.should_not have_selector('title', :text => '| 首页')
    end
  end
end

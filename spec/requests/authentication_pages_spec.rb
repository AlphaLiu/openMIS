#encoding:utf-8
require 'spec_helper'

describe "AuthenticationPages" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_selector('h1',    text: '登录') }
    it { should have_selector('title', text: '登录') }
  end

  describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "登录" }

      it { should have_selector('title', text: '登录') }
      it { should have_selector('div.alert.alert-error', text: '无效的') }

      describe "after visiting another page" do
        before { click_link "首页" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "用户名",    with: user.name
        fill_in "密码", with: user.password
        click_button "登录"
      end

      it { should have_link('退出登录', href: signout_path) }

      describe "followed by signout" do
        before { click_link "退出登录" }
        it { should_not have_link('退出登录') }
      end
    end
  end
end

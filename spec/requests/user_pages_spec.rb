#encoding:utf-8
require 'spec_helper'

describe "UserPages" do
	subject { page }

	describe "signup page" do
		before { visit signup_path }

		it { should have_selector('h1',    text: '创建新用户') }
		it { should have_selector('title', text: full_title('创建新用户')) }
	end

	describe "signup" do

		before { visit signup_path }

		let(:submit) { "创建用户" }

		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end
		end

		describe "with valid information" do
			before do
				fill_in "用户名",         with: "Example User"
				fill_in "电子邮箱",        with: "user@example.com"
				fill_in "密码",     with: "foobar"
				fill_in "确认密码", with: "foobar"
			end

			it "should create a user" do
				expect { click_button submit }.to change(User, :count).by(1)
			end

		end
	end


end

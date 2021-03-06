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

       describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by_name('Example User') }

        it { should have_link('退出登录') }
      end

		end
	end

  describe "edit" do
    let(:user) { FactoryGirl.create(:user) }
    before do
      sign_in user
      visit edit_user_path(user) 
    end

    describe "page" do
      it { should have_selector('h1',    text: "更新信息") }
      it { should have_selector('title', text: "更新信息") }
    end

    describe "with invalid information" do
      before { click_button "保存改变" }

      it { should have_content('错误') }
    end

    describe "with valid information" do
      let(:new_email) { "new@example.com" }
      before do
        fill_in "电子邮箱",            with: new_email
        fill_in "密码",         with: user.password
        fill_in "确认密码", with: user.password
        click_button "保存改变"
      end

      it { should have_selector('div.alert.alert-success') }
      it { should have_link('退出登录', href: signout_path) }
      specify { user.reload.email.should == new_email }
    end
  end


end

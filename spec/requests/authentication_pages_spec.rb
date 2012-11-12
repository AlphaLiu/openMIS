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
      before { sign_in user}

      it { should have_link('退出登录', href: signout_path) }

      describe "followed by signout" do
        before { click_link "退出登录" }
        it { should_not have_link('退出登录') }
      end
    end
  end

  describe "authorization" do

    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      describe "in the Users controller" do

        describe "visiting the edit page" do
          before { visit edit_user_path(user) }
          it { should have_selector('title', text: '登录') }
        end

        describe "submitting to the update action" do
          before { put user_path(user) }
          specify { response.should redirect_to(signin_path) }
        end
      end

      #describe "when attempting to visit a protected page" do
        #before do
          #visit edit_user_path(user)
          #fill_in "用户名",    with: user.name
          #fill_in "密码", with: user.password
          #click_button "登录"
        #end

        #describe "after signing in" do

          #it "should render the desired protected page" do
            #page.should have_selector('title', text: '更新信息')
          #end
        #end
      #end
    #end

    describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, name: "wrong_user") }
      before { sign_in user }

      describe "visiting Users#edit page" do
        before { visit edit_user_path(wrong_user) }
        it { should_not have_selector('title', text: full_title('更新信息')) }
      end

      describe "submitting a PUT request to the Users#update action" do
        before { put user_path(wrong_user) }
        specify { response.should redirect_to(root_path) }
      end
    end 
  end
end

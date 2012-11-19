#encoding:utf-8
class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:show, :index, :edit, :update]

  before_filter :correct_user, only: [:show, :edit, :update]
  before_filter :admin_user, only: [:index]

	def index
		@users = User.all ##use 'all' is a risk, fix it later.
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params[:user])
		if @user.save
      sign_in @user
			flash[:success] = "用户 #{@user.name} 创建成功！"
      #redirect_to users_path
      redirect_back_or users_path
	  else
	  	render 'new'
	  end
	end

	def show
	end

  def edit
  end

  def update

    if @user.update_attributes(params[:user])
      flash.now[:success] = "个人密码更行成功"
      sign_in @user
      render 'edit'
    else
      render 'edit'
    end
  end

  def editinfo
    @user = current_user 
  end

  def updateinfo
    @user = current_user
    if @user.update_attribute(:email, params[:user][:email]) && @user.userinfo.update_attributes(params[:user][:userinfo])
      flash[:success] = "个人信息更新成功"
      sign_in @user
      redirect_to @user
    else
      render 'eidtinfo'
    end
  end


  private
  def signed_in_user
    unless signed_in?
      #store_location
      redirect_to signin_url, notice: "请先登录."
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
    redirect_to(current_user) unless admin?(current_user)
  end
end

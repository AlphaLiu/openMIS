#encoding:utf-8
class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:show, :index, :edit, :update]

  before_filter :correct_user, only: [:show, :edit, :update]

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
      flash[:success] = "个人信息更新"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
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
end
#encoding:utf-8
class UsersController < ApplicationController

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
      redirect_to users_path
	  else
	  	render 'new'
	  end
	end

	def show
		@user = User.find(params[:id])
	end

  def edit
    @user = User.find(params[:id])
  end
end

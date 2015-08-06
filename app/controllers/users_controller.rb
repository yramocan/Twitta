class UsersController < ApplicationController
	def index
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			log_in @user
			flash[:success] = "Welcome to Twitta!"
			redirect_to @user
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
	end

	def destroy
	end

	private
	    def user_params
	    	params.require(:user).permit(:name, :email, :password, :password_confirmation)
	    end
end

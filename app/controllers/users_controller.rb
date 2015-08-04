class UsersController < ApplicationController
	def index 
		@users = User.all
	end

	def show
		@user = User.find(params[:id])

	end

	def create
		@user = User.new(user_params)
		if @user.save
			render "index"
		else
			# puts @user.errors.messages
			render "new"
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		begin
			@user.update_attributes!(user_params)
			redirect_to :action => :show
		rescue ActiveRecord::RecordInvalid => e
			render :edit
		end
	end

	def destroy
		@user = User.find(params[:id])
		#User.delete(@user.id)
		@user.destroy
		redirect_to :action => :index
	end

	private 

	def user_params
		params.require(:user).permit(:name, :email)
	end 
end

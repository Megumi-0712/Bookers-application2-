class UsersController < ApplicationController

    before_action :authenticate_user!

    def index
    end

	def new
		@user = User.new
        @book = Book.new
	end

	def show
		@user = current_user
        @book = Book.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
    	@user = User.find(params[:id])
    	if @user.update(user_params)
            flash[:notice] = "You have updated user successfully."
            redirect_use_path(User.last)
    else
        flash.now[:error]
        render :edit
    end

    private
    def user_params
    	params.require(:user).permit(:name, :profile_image)
    end
end

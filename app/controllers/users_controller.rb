class UsersController < ApplicationController

    before_action :authenticate_user!

	def new
		@user = User.new
	end

	def show
		@user = current_user
    end

    def edit
    end

    def update
    	@user = User.find(params[:id])
    	@user.update(user_params)
    	redirect_use_path(user.id)
    end

    private
    def user_params
    	params.require(:user).permit(:name, :profile_image)
    end
end

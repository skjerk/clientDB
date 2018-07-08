class UsersController < ApplicationController
    def index
        @title = 'Users Index'
        @breadcrumbs = { "Users"=>users_path }
        @users = User.all
    end
    
    def show
        @title = 'View User'
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to users_path
        else
            render 'new'
        end
    end

    def update
        @user = User.find(params[:id])
        
        if @user.update(user_params)
            redirect_to users_path
        else
            render 'edit'
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy

        redirect_to users_path
    end

private
    def user_params
        params.require(:user).permit(:firstname, :lastname, :email)
    end
end

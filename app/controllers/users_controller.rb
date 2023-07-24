class UsersController < ApplicationController

    def index 
      @users = User.all
      
      render json: @users
    end

    def create
      @user = User.new(user_params)
      @user.uid = @user.email
  
      if @user.save
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
    
    def login 
      @user = User.where(email: login_params[:email]).first()

      if @user && @user.valid_password?(login_params[:password])
        render json: @user, status: :ok
      else 
        render json: { error: 'Credenciais inválidas' }, status: :unauthorized
      end
    end

    private
        def user_params
            params.require(:user).permit(:name, :email, :password)
        end

        def login_params
          params.require(:sign_in).permit(:email, :password)
        end

end
  
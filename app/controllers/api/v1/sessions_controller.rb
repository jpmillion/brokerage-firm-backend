class Api::V1::SessionsController < ApplicationController
    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            render json: { user: UserSerializer.new(user) }
        else
            render json: { errors: 'Invalid email or password' }
        end
    end
end

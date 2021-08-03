class Api::V1::SessionsController < ApplicationController
    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            token = issue_token(user)
            render json: { user: UserSerializer.new(user), token: token }
        else
            render json: { errors: 'Invalid email or password' }
        end
    end

    def authenticate
        token = request.headers['Authenticate']
        user = User.find(decoded_token(token))

        render json: { user: UserSerializer.new(user), token: token }
    end
end

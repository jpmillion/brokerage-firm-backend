class Api::V1::UsersController < ApplicationController
    include HTTParty

    def google_oauth2
      url = "https://www.googleapis.com/oauth2/v3/tokeninfo?id_token=#{params["id_token"]}"                  
      response = HTTParty.get(url)                   
      user = User.create_user_for_google(response.parsed_response)
      if user                           
        render json: { user: UserSerializer.new(user) }
      else
        render json: { errors: user.errors.full_messages }
      end
    end
end

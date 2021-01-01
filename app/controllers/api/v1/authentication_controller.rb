module Api::V1
  class AuthenticationController < ApplicationController
    def retireve_acces_token
      response = HTTParty.post(
        "https://quire.io/oauth/token",
        headers: {
          'Content-Type' => 'application/json'
        },
        body: {
          grant_type: "authorization_code",
          code: params[:code],
          client_id: AppConfig.quire_client_id,
          client_secret: AppConfig.quire_client_secret
        }
      ).parsed_response
      Project.sync_user_projects(JSON.parse(response)["access_token"])
      render json: response, status: :ok
    end
  end
end

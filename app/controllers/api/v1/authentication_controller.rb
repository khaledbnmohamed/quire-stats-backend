module Api::V1
  class AuthenticationController < ::Api::BaseController

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
      )
      render json: "ok", status: :ok

    end

  end
end

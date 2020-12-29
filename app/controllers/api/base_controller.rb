module Api
  class BaseController < ApplicationController
    include ::Errors::ErrorHandler
    respond_to :json
    protect_from_forgery with: :null_session, if: -> { request.format.json? }
    # before_action :authenticate_request

    def pundit_user
      current_user
    end

    def current_user
      @current_user ||= authenticated_current
    end

    private

    def authenticate_request
      @current_user = authenticated_current
      raise Errors::CustomError.new(:unauthorized, 401, "Authentication Error", @auth_error_extra) unless @current_user
    end

    def authenticated_current
      AuthenticateApiRequestService.new(http_auth_header).call
    end

    def http_auth_header
      request.headers['Authorization']&.split(' ')&.last
    end

    def authenticate_admin_user!
      # overriding active admin authenication method only in the api base controller
      # to avoid redirection on authentication failture and keep the 401 consistent authenication error
      current_admin_user
    end
  end
end

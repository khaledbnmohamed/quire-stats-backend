class AuthenticateApiRequestService
  def initialize(token)
    @token = token
  end

  def call
    return unless decoded_auth_token
    raise Errors::CustomError.new(:unauthorized, 401, "Authentication Error") if expired_token?

    user
  end

  private

  attr_reader :token

  def user
    @user_type = decoded_auth_token[:data][:type]
    @user ||= decoded_auth_token[:data][:type].singularize.classify.constantize.find(decoded_auth_token[:data][:id]) if decoded_auth_token[:data]
  end

  def decoded_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(token)
  end

  def expired_token?
    # || AUTH_TOKENS_BLACKLIST.get(token)
    Time.zone.now > Time.zone.at(decoded_auth_token[:exp])
  end
end

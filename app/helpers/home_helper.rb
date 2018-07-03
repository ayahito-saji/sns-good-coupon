module HomeHelper
  def getClient(current_user)
    return nil unless current_user
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['APP_ID']
      config.consumer_secret     = ENV['APP_SECRET']
      config.access_token        = current_user.key
      config.access_token_secret = current_user.secret
    end
    client
  end
end

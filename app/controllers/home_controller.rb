class HomeController < ApplicationController
  def index
    if logged_in?
      @client = getClient(current_user)
    end
  end
end

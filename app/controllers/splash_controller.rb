class SplashController < ApplicationController
  def index
    redirect_to groups_path if current_user
  end
end

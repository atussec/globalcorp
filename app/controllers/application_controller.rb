class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :ensure_player

  private
  def ensure_player
    if not user_signed_in?
      redirect_to welcome_index_path
      return
    end
    @user = current_user
    @player = @user.player
  end

end

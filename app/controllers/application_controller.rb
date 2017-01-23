class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def ensure_player
    unless user_signed_in?
      redirect_to welcome_index_path
      return
    end
    @user = current_user
    @player = @user.player
    unless @player.present?
      redirect_to new_player_path
    end
  end
end

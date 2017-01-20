class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def ensure_player
    if not user_signed_in?
      redirect_to welcome_index_path
      return
    end
    @user = current_user
    @player = @user.player
    if not @player
      redirect_to new_player_path
    end
  end

end

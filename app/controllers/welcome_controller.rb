class WelcomeController < ApplicationController

  def index
    if user_signed_in?
      @player = current_user.player
    end
  end

  def anonymous
    if user_signed_in?
      redirect_to edit_user_registration_path
    end
    @user = generate_anonymous
    sign_in(@user)
    redirect_to welcome_index_path
  end


  private
  # Private: create an anonymous account for this user.
  #
  # email and password share the same random token
  # to allow the user to change his password later on
  # without it being a standard one.
  #
  # Warning: The users email should not be leaked!
  #
  # Returns the user created and saved.
  def generate_anonymous
    temp_token = SecureRandom.base64(15).tr('+/=', 'xyz')
    usr = ::User.new(email: "#{temp_token}@users.globalcorp.international", password: temp_token, password_confirmation: temp_token)
    usr.save!(validate: false)
    usr
  end
end

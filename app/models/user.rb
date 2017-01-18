class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Public: create an anonymous account for this user.
  #
  # email and password share the same random token
  # to allow the user to change his password later on
  # without it being a standard one.
  #
  # Warning: The users email should not be leaked!
  #
  # Returns the user created and saved.
  def anonymous!
    temp_token = SecureRandom.base64(15).tr('+/=', 'xyz')
    usr = ::User.new(email: "#{temp_token}@users.globalcorp.international", password: temp_token, password_confirmation: temp_token)
    usr.save!(validate: false)
    usr
  end

end

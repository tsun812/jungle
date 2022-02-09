class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :email, presence:{ case_sensitive: false }, uniqueness:  { case_sensitive: false }
  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true
  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    if user
       user.authenticate(password)
    else   
      nil
    end
  end

end

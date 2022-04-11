class User < ActiveRecord::Base

  has_secure_password

  
  validates :password, presence: true, length: { minimum: 4 }
  validates :password_confirmation, presence: true, length: { minimum: 4 }
  validates :name, presence: true
  validates :email, :uniqueness => { :case_sensitive => false }, presence: true

  def self.authenticate_with_credentials(email, password)
    
    if (email)
    
    user = User.find_by_email(email.downcase.strip)
      if user && user.authenticate(password)
        return user
      end
    end
  end  
end

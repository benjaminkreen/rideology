class User < ActiveRecord::Base
  attr_accessible :fname, :lname, :username, :password, :email
  validates :fname, :lname, :username, :presence => true
  validates :username, :uniqueness => true
  validates :password, :length => {:minimum => 6}, :on => :create
  attr_reader :password
  validate :ensure_token
  
  def self.generate_token
    SecureRandom.urlsafe_base64(16)
  end
  
  has_many :ride_takes
  has_many :ride_offers
  
  has_many(
    :takes,
    :through => :ride_takes,
    :source => :ride_offer
  )
  
  def self.find_by_credentials(username, secret)
    @user = User.find_by_username(username)
    return @user unless @user
    if @user.is_password?(secret)
      return @user
    else
      return nil
    end
  end
  
  def is_password?(secret)
    BCrypt::Password.new(self.password_digest).is_password?(secret)
  end
  
  def password=(secret)
    @password = secret
    self.password_digest = BCrypt::Password.create(secret)
  end
  
  def reset_token
    self.token = User.generate_token
  end
  
  def reset_token!
    self.token = User.generate_token
    self.save!
  end
  
  private
  
  def ensure_token
    self.token ||= User.generate_token
  end
  
end

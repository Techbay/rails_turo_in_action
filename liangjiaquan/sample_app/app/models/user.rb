class User < ActiveRecord::Base
	attr_accessor :remember_token, :activation_token
  # downcase email before save
  # before_save { self.email = email.downcase }
  # execise 6.2
  before_save :downcase_email
	before_save :create_activation_digest
  # valid name
  validates :name, presence: true, length: { maximum: 50 }
  # valid email
  # the REGEX is deffirent from the book
  VALID_EMAIL_REGEX = /\A[\w\+\-.]+@(\.*[a-z\d\-]+)+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255}, 
  format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  
  has_secure_password
  
  validates :password, length: { minimum: 6 }, allow_blank: true

	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost	? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		 BCrypt::Password.create(string, cost: cost)
	end

	def User.new_token
		SecureRandom.urlsafe_base64
	end
	
	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	def authenticated?(attribute, token)
	  digest = send("#{attribute}_digest")
		return false if digest.nil?
		BCrypt::Password.new(digest).is_password?(token)
	end

	def forget
		update_attribute(:remember_digest, nil)
		
	end

  def activate
  	update_attribute(:activated, true)
		update_attribute(:activated_at, Time.zone.now)
  end

  def send_activation_email
  	UserMailer.account_activation(self).deliver_now
  end
	private
	
	  def downcase_email
	  	self.email = email.downcase
	  end

		def create_activation_digest
		  self.activation_token = User.new_token
			self.activation_digest = User.digest(activation_token)
		end
end

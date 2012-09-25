class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me

  attr_accessible :facebook_uid	, :facebook_token,
  								:twitter_uid	, :twitter_token,
  								:github_uid		, :github_token


	validates :username, 	presence: true, uniqueness: true
	validates :email, 		presence: true, uniqueness: true


	def self.from_omniauth(auth)
		# TWITTER: provider == "TWITTER", auth.info.nickname
		# FACEBOOK: 
  	where(twitter_uid: auth.uid).first_or_create do |user|
  		if auth.provider == "facebook"
  			Logger.new(STDOUT).debug(auth.to_json.to_s)
  			user.facebook_uid = auth.uid
  			user.username 		= auth.info.nickname
  			user.email 				= auth.info.email
  		elsif auth.provider == "twitter"
  			Logger.new(STDOUT).debug(auth.to_json.to_s)
  			user.twitter_uid 	= auth.uid
  			user.username 		= auth.info.nickname
  		elsif auth.provider == "github"
  		end
  	end
  end

  def self.new_with_session(params, session)
  	if session["devise.user_attributes"]
  		new(session["devise.user_attributes"], without_protection: true) do |user|
  			user.attributes = params
  			user.valid?
  		end
  	else
  		super  
  	end
  end

  def password_required?
  	super || twitter_uid.blank? || self.facebook_uid.blank? || self.github_uid.blank?
  end

  def update_with_password(params, *options)
  	if encrypted_password.blank?
  		update_attributes(params, *options)
  	else
  		super
  	end
  end
end

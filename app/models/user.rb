class User < ActiveRecord::Base
	validates :email,
	confirmation: true,
	presence: true, # this needs to exist when user is created
	

	validates_uniqueness_of :email, case_sensitive: false
	 # how unique do you want entry to be

	validates_presence_of :password, on: :create

	validates :name,
	presence: true,
	length: { maximum: 20 }

	validates :password_confirmation, presence: true



# because we installed bcrypt, can use below. use in conjunction with password_digest
	has_secure_password

	has_many :post

	# find user object with id
	def self.authenticate email, password
		#access model, try substitutes for conditional. try the authenticate method on password.
		User.find_by_email(email).try(:authenticate, password)

		# same as user if user.authenticate(password)

	end

end

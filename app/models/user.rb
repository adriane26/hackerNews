class User < ActiveRecord::Base
	has_many :post

	validates :email,
	# confirmation: true,
	# uniqueness: true,
	uniqueness: {case_sensitive: false},
	presence: true 
	# this needs to exist when user is created
	

  validates :password,
  presence: true,
  length: {
    minimum: 8,
    maximum: 99,
    too_short: "must be greater than %{count} characters",
    too_long: "must be less than %{count} characters"
  },
  confirmation: true,
  on: :create

	validates :name,
	presence: true,
	length: { maximum: 20, too_long: "must be less than %{count} letters" }

	validates :password_confirmation, 
	presence: true



# because we installed bcrypt, can use below. use in conjunction with password_digest
	has_secure_password


	# find user object with id
	def self.authenticate email, password
		#access model, try substitutes for conditional. try the authenticate method on password.
		User.find_by_email(email).try(:authenticate, password)

		# same as user if user.authenticate(password)

	end

end

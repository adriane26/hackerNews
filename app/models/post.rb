class Post < ActiveRecord::Base
  belongs_to :user

  validates :title,
  presence: true,
   length: {
    minimum: 10,
    maximum: 100,
    too_short: "must be at least %{count} letters",
    too_long: "must be less than %{count} letters"
  }

  validates :link,
  presence: true,
  url: true
  
  # format: { with: @^(https?|ftp)://[^\s/$.?#].[^\s]*$@iS,
    # message: "must be valid url" }

end

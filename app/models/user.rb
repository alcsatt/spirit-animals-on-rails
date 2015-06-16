class User < ActiveRecord::Base
  has_secure_password

  has_one :personal_deck
  has_many :games

end

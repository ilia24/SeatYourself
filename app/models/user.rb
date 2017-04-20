class User < ApplicationRecord
  has_secure_password
<<<<<<< HEAD

  validates :name, :email, :password, presence: true 
=======
  has_many :reservations
  has_many :restaurants, through: :reservations
>>>>>>> fae44cec227a0ac4c4894a1808ed50170d7cfff3
end

class User < ApplicationRecord
    validates :name, presence: true
    validates :name, uniqueness: true

    validates :email, presence: true
    validates :email, uniqueness: true

    validates :password, presence: true
    has_secure_password
end

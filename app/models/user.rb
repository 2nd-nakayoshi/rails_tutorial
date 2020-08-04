class User < ApplicationRecord
    has_many :blogs, dependent: :destroy
    has_many :comments

    validates :name, presence: true
    validates :name, uniqueness: true

    validates :email, presence: true
    validates :email, uniqueness: true

    
    has_secure_password
    validates :password, presence: true, allow_nil: true
end

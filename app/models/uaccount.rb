class Uaccount < ApplicationRecord
    has_secure_password
    validates :name, :password, :address, :contact, :state, :email, :gender, presence: true
end

class User < ApplicationRecord
    attr_accessor :password, :password_confirmation
    has_secure_password
end

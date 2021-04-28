class User < ApplicationRecord
    has_many :registrations
    has_many :events, through: :registrations


    validates :name, presence: true
    validates :email, presence: true, format: { with: /.+\@.+\..+/ }
    validates :username, presence: true
    validates :password, presence: true, confirmation: true

    before_create :encrypt_password

    module Encryptor 
        require 'digest'
        def self.encrypt(password)
          Digest::SHA1.hexdigest(password)
        end

        def self.salted(password, head="are you trying to break the code?", tail="forget about it, man")
            "#{head}#{password}#{tail}"
        end
    end

    def self.login(params)
        username = params[:username]
        password = params[:password]
        salted_password = Encryptor.salted(password)
        encrypted_password = Encryptor.encrypt(salted_password)
        find_by(username: username, password: encrypted_password)
    end

    private 
    def encrypt_password
        salted_pwd = Encryptor.salted(password)
        self.password = Encryptor.encrypt(salted_pwd)
    end

end

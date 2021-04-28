class Event < ApplicationRecord

    validates :name, presence: true
    validates :email, presence: true, format: { with: /.+\@.+\..+/ }
    validates :username, presence: true
    validates :password, presence: true, confirmation: true
end

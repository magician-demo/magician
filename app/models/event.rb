class Event < ApplicationRecord
    has_many :registrations
    has_many :users, through: :registrations

    validates :name, presence: true
    validates :host, presence: true
    validates :location, presence: true
    validates :time, presence: true
    validates :description, presence: true
end

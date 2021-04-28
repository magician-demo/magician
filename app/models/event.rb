class Event < ApplicationRecord


    validates :name, presence: true
    validates :host, presence: true
    validates :location, presence: true
    validates :time, presence: true
    validates :description, presence: true
end

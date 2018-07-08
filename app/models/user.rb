class User < ApplicationRecord
    has_many :notes

    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :email, presence: true

end

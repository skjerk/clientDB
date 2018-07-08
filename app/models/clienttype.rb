class Clienttype < ApplicationRecord
    has_many :clients

    validates :text, presence: true

end

class Client < ApplicationRecord
  belongs_to :clienttype
  has_many :contacts
  has_many :notes

  validates :name, presence: true
  validates :address, presence: true
  validates :zip, presence: true
  validates :city, presence: true
  validates :phone1, presence: true
  validates :email, presence: true
  
  # Setter and getter for clienttype text - useful for creation via dropdowns in forms
  def clienttype_text=(text)
    self.clienttype = Clienttype.find_by_text(text)
  end

  def clienttype_text
    self.clienttype ? self.clienttype.text : nil
  end

end

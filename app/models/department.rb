class Department < ApplicationRecord
  has_many :positions
  has_many :teams
  has_many :notes, as: :notable
  polymorphic_has_many :notes, as: :notable

end

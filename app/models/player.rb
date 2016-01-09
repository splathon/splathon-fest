class Player < ApplicationRecord
  belongs_to :fest
  validates :name, presence: true, length: { maximum: 16 }

  def to_s
    name
  end
end

class Fest < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }

  def to_s
    name
  end
end

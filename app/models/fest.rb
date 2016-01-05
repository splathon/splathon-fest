class Fest < ApplicationRecord
  has_many :themes
  validates :name, presence: true, length: { maximum: 255 }

  def to_s
    name
  end
end

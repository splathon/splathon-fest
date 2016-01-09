class Fest < ApplicationRecord
  has_many :themes
  has_many :players

  validates :name, presence: true, length: { maximum: 255 }
  enum status: { in_preparation: 0, opened: 1 }

  def to_s
    name
  end
end

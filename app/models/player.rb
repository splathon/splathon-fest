class Player < ApplicationRecord
  belongs_to :fest
  validates :name, presence: true, length: { maximum: 16 }
  after_create :notify_creation

  def to_s
    name
  end

  def notify_creation
    ActionCable.server.broadcast "fest:#{fest.id}", self
  end
end

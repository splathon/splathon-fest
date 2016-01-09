class Theme < ApplicationRecord
  belongs_to :fest, required: true
  enum status: { ready: 0, opened: 1 }

  %i(alpha bravo).each do |team|
    validates team, presence: true, length: { maximum: 32 }
  end

  def to_s
    "#{alpha} vs #{bravo}"
  end
end

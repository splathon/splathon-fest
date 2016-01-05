class Theme < ApplicationRecord
  belongs_to :fest, required: true

  %i(alpha bravo).each do |team|
    validates team, presence: true, length: { maximum: 32 }
  end

  def to_s
    "#{alpha} vs #{bravo}"
  end
end

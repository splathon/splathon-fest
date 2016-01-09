class Vote < ApplicationRecord
  belongs_to :theme, required: true
  belongs_to :player, required: true
  enum side: { alpha: 0, bravo: 1 }

  validates_each :theme do |record, attr, value|
    record.errors[attr] << 'invalid theme' unless value.fest == record.player.fest
  end
end

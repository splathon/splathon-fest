class Vote < ApplicationRecord
  belongs_to :theme, required: true
  belongs_to :player, required: true
  enum side: { alpha: 0, bravo: 1 }
  enum status: { default: 0, selected: 1 }

  validates_each :theme, on: :create do |record, attr, value|
    record.errors[attr] << 'invalid theme' unless value.fest == record.player.fest
    record.errors[attr] << 'must be opened' unless value.opened?
  end
end

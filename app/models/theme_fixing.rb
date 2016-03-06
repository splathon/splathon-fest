class ThemeFixing
  include ActiveModel::Model
  include Virtus.model

  attribute :theme_id, Integer
  attribute :theme, Theme
  attribute :alpha, Array[Vote]
  attribute :bravo, Array[Vote]

  validates :theme_id, type: { is: Integer }
  validates :theme, type: { is: Theme }
  validates_each :theme do |record, attr, value|
    record.errors[attr] << 'must be opened' if value && !value.opened?
    record.errors[attr] << 'must under opened fest' if value && !value.fest.opened?
  end

  def theme_id=(theme_id)
    @theme = nil unless theme_id == @theme.try(:id)
    super
  end

  def theme
    @theme ||= Theme.find_by(id: theme_id)
    super
  end

  def theme=(theme)
    self.theme_id = theme.try(:id)
    super
  end

  def save
    Theme.transaction do
      theme.fest.try(:lock!)
      theme.try(:lock!)
      return false unless valid?
      theme.update(status: 'fixed')
      select_both_votes(theme)
    end
    ActionCable.server.broadcast(
      "fest:#{theme.fest.id}",
      event: 'fix_theme',
      alpha: alpha.map(&:player).map(&:name),
      bravo: bravo.map(&:player).map(&:name))
  end

  private

  def select_both_votes(theme)
    self.alpha = select_votes(theme, :alpha)
    self.bravo = select_votes(theme, :bravo)
  end

  def select_votes(theme, side)
    theme
      .votes
      .where(side: side)
      .to_a
      .shuffle
      .take(4)
      .each { |v| v.update(status: 'selected') }
  end
end

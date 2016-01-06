class FestKickoff
  include ActiveModel::Model
  include Virtus.model

  attribute :fest_id, Integer
  attribute :fest, Fest

  validates :fest_id, type: { is: Integer }
  validates :fest, type: { is: Fest }
  validates_each :fest do |record, attr, value|
    if value && !value.in_preparation?
      record.errors[attr] << 'must be in preparation'
    end
  end

  def fest_id=(fest_id)
    @fest = nil unless fest_id == @fest.try(:id)
    super
  end

  def fest
    @fest ||= Fest.find_by(id: fest_id)
    super
  end

  def fest=(fest)
    self.fest_id = fest.try(:id)
    super
  end

  def save
    Fest.transaction do
      fest.try(:lock!)
      return false unless valid?
      fest.update(status: 'opened')
    end
  end
end

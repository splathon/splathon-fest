class TypeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if options[:is_bool]
      validate_is_bool(record, attribute, value)
    elsif options[:is].is_a?(Class)
      validate_is(record, attribute, value, options[:is])
    elsif options[:in].is_a?(Array)
      validate_in(record, attribute, value, options[:in])
    else
      raise 'invalid TypeValidator usage'
    end
  end

  private

  def validate_is_bool(record, attribute, value)
    register_error(record, attribute, 'Boolean') if !value.is_a?(TrueClass) && !value.is_a?(FalseClass)
  end

  def validate_is(record, attribute, value, klass)
    register_error(record, attribute, klass) unless value.is_a?(klass)
  end

  def validate_in(record, attribute, value, klasses)
    value_is_in_types = klasses.any? { |klass| value.is_a?(klass) }
    register_error(record, attribute, klasses) unless value_is_in_types
  end

  def register_error(record, attribute, expected)
    record.errors[attribute] << (options[:message] || "isn't a #{expected.inspect}")
  end
end

module DateValidations
  
  def should_validate_future_date(attribute)
    @instance = get_instance_of(self)
    @instance.send("#{attribute}=", 7.days.ago)
    assert_equal false, @instance.valid?
    assert_contains(@instance.errors.on[attribute], /#{attribute} should be in the future/)
    @instance.send("#{attribute}=", Time.now + 7.days)
    assert_valid @instance
  end
  
  def get_instance_of(object_or_klass)
    if object_or_klass.is_a?(Class)
      klass = object_or_klass
      instance_variable_get("@#{instance_variable_name_for(klass)}") || klass.new
    else
      object_or_klass
    end
  end
  
end

class ActiveSupport::TestCase
  #extend DateValidations
end
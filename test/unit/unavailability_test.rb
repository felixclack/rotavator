require File.dirname(__FILE__) + '/../test_helper'

class UnavailabilityTest < ActiveSupport::TestCase
  context "an unavailability instance" do
    setup do
      @unavailability = Factory(:unavailability)
    end

    should_belong_to :user, :dependent => :destroy
    should_validate_presence_of :user_id
    should_require_unique_attributes :from, :scoped_to => [:user_id]

    should "validate from date is in the future" do
      @unavailability.from = 7.days.ago
      assert_equal false, @unavailability.valid?
      assert_contains(@unavailability.errors[:from], /From date should be in the future/)
      @unavailability.from = Time.now + 7.days
      assert_valid @unavailability
    end
    
    should "validate to date is in the future" do
      @unavailability.to = 7.days.ago
      assert_equal false, @unavailability.valid?
      assert_contains(@unavailability.errors[:to], /To date should be in the future/)
      @unavailability.to = Time.now + 7.days
      assert_valid @unavailability
    end
    
    should "validate to date is greater than from date" do
      @unavailability.from = Time.now + 7.days
      @unavailability.to = Time.now + 6.days
      assert_equal false, @unavailability.valid?
      assert_contains(@unavailability.errors[:base], /To date should be after from date/)
      @unavailability.to = Time.now + 8.days
      assert_valid @unavailability
    end
    
    #should_validate_future_date :from
  end
  
end

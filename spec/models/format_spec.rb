require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Format do
  before(:each) do
    @valid_attributes = {
      :string => 
    }
  end

  it "should create a new instance given valid attributes" do
    Format.create!(@valid_attributes)
  end
end

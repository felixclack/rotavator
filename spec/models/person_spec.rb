require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Person do
  before(:each) do
    @valid_attributes = {
    }
  end
  
  describe "with a named project" do
    before(:each) do
      @person = Person.new
      @projects = [
        {
          "announcement"=>"Choir / Muso's / Production Team / PY Band / Media", 
          "name"=>"WACA+MEDIA", 
          "status"=>"active", 
          "company"=>{"name"=>"Xcel Church", "id"=>92003}, 
          "created-on"=>"Thu, 28 Jul 2005", 
          "last-changed-on"=>"Thu Oct 02 09:38:05 UTC 2008", 
          "id"=>154701
        }, 
        {
          "name"=>"Durham Team", 
          "status"=>"active", 
          "company"=>{"name"=>"Xcel Church", "id"=>92003}, 
          "created-on"=>"Fri, 19 Sep 2008", 
          "last-changed-on"=>"Tue Sep 30 16:30:09 UTC 2008", 
          "id"=>2455321
        }
      ]
      @basecamp = mock(Basecamp)
    end
    
    it "should be a member" do
      @basecamp.should_receive(:projects).and_return(@projects)
      Basecamp.should_receive(:new).and_return(@basecamp)
      @person.check_for_project_name("WACA+MEDIA").should be_true
    end
    
    it "should not be a member" do
      @basecamp.should_receive(:projects).and_return(@projects)
      Basecamp.should_receive(:new).and_return(@basecamp)
      @person.check_for_project_name("Venue Design Team").should_not be_true
    end
    
  end
  
end

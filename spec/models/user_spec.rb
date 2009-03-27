require File.dirname(__FILE__) + '/../spec_helper'

describe User do
  fixtures :users
  
  describe "with a valid basecamp login" do
    before(:each) do
      @user = User.new
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
      @basecamp.should_receive(:projects).and_return(@projects)
      Basecamp.should_receive(:new).and_return(@basecamp)
    end
    
    describe "is a member of WACA" do  
      it "should authenticate" do
        @user.check_for_project_name("WACA+MEDIA").should be_true
      end
    end
    
    describe "is not a member of WACA" do
      it "should not authenticate" do
        @user.check_for_project_name("Venue Design Team").should_not be_true
      end
    end

  end

  describe 'being created' do
    before do
      @user = nil
      @creating_user = lambda do
        @user = create_user
        violated "#{@user.errors.full_messages.to_sentence}" if @user.new_record?
      end
    end

    it 'increments User#count' do
      @creating_user.should change(User, :count).by(1)
    end

  end


end

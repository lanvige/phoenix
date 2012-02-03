require "spec_helper"

module Phoenix
  describe RegistrationsController do
    #let(:user) { FactoryGirl.create(:user) }
    
    describe "#new" do
      it "should render the new template" do
        get "new"
        response.should be_success
        response.should render_template("refinery/admin/users/new")
      end
    end
    
  end
end
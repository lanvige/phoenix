require 'spec_helper'

module Phoenix
  describe User do
    let(:user) { FactoryGirl.create(:user) }
    
    context "validations" do
      # email and password validations are done by including devises validatable
      # module so those validations are not tested here
      let(:attr) do
        {
          :username => "Phoenix",
          :email => "phoneix@example.com",
          :password => "123456",
          :password_confirmation => "123456"
        }
      end

      it "requires username" do
        User.new(attr.merge(:name => "")).should_not be_valid
      end
    end
    
  end
end

module Phoenix
  module Testing
    module ControllerMacros
      module Authentication
        def login_user
          before(:each) do
            @user = FactoryGirl.create(:user)
            @request.env["devise.mapping"] = Devise.mappings[:admin]
            sign_in @user
          end
        end

        def login_phoenix_user
          before(:each) do
            @phoenix_user = FactoryGirl.create(:phoenix_user)
            @request.env["devise.mapping"] = Devise.mappings[:admin]
            sign_in @phoenix_user
          end
        end

        def login_phoenix_translator
          before(:each) do
            @phoenix_translator = FactoryGirl.create(:phoenix_translator)
            @request.env["devise.mapping"] = Devise.mappings[:admin]
            sign_in @phoenix_translator
          end
        end
      end
    end
  end
end

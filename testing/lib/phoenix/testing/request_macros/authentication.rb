module Phoenix
  module Testing
    module RequestMacros
      module Authentication
        def login_phoenix_user
          before(:each) do
            FactoryGirl.create(:phoenix_user, :username => "phoenix",
                                    :password => "123456",
                                    :password_confirmation => "123456",
                                    :email => "phoenix@example.com")
            visit new_phoenix_user_session_path
            fill_in "Login", :with => "phoenix"
            fill_in "Password", :with => "123456"
            click_button "Sign in"
          end
        end

        def login_phoenix_translator
          before(:each) do
            FactoryGirl.create(:phoenix_user)
            user = FactoryGirl.create(:phoenix_translator, :password => "123456",
                                      :password_confirmation => "123456")

            visit new_phoenix_user_session_path
            fill_in "Login", :with => user.username
            fill_in "Password", :with => "123456"
            click_button "Sign in"
          end
        end
      end
    end
  end
end

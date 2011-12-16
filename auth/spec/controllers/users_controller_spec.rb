require 'spec_helper'

describe Phoenix::UsersController do
  let(:user) { Factory(:user) }

  before do
    sign_in user
  end

  context '#create' do
    it 'should create a new user' do
      post :create, { :user => { :email => 'pe@example.com', :password => 'password01!', :password_confirmation => 'password01!' } }
      assigns[:user].new_record?.should be_false
    end
  end

  context '#update' do
    context 'when updating own account' do
      it 'should perform update' do
        put :update, { :user => { :email => 'mynew@email-address.com' } }
        assigns[:user].email.should == 'mynew@email-address.com'
        response.should redirect_to(phoenix.account_url(:only_path => true))
      end
    end

    context 'when attempting to update other account' do
      it 'should not allow update' do
        put :update, { :user => Factory(:user) }, { :user => { :email => 'mynew@email-address.com' } }
        response.should redirect_to(phoenix.login_url(:only_path => true))
      end
    end
  end
end
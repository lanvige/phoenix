require 'spec_helper'

describe Phoenix::User do
  #before(:all) {  }

  it 'should generate the reset password token' do
    user = Factory.build(:user)
    phoenix::UserMailer.should_receive(:reset_password_instructions).with(user).and_return(double(:deliver => true))
    user.send_reset_password_instructions
    user.reset_password_token.should_not be_nil
  end

  context '#create' do
    let(:user) { Factory.build(:user) }

    it 'should not be anonymous' do
      user.should_not be_anonymous
    end
  end

  context '#save' do
    let(:user) { Factory.build(:user) }

    context 'when there are no admin users' do
      it 'should assign the user an admin role' do
        user.save
        user.has_role?('admin').should be_true
      end
    end

    context 'when there are existing admin users' do
      before { Factory(:admin_user) }

      it 'should not assign the user an admin role' do
        user.save
        user.has_role?('anonymous?').should be_false
      end
    end
  end
end

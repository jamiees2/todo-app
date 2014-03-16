require 'spec_helper'

describe User do
  before do
    @user = FactoryGirl.create :user
  end

  subject { @user }

  it { should respond_to :uid }
  it { should respond_to :nickname }
  it { should respond_to :api_key }

  specify { @user.api_key.present?.should be true } 
end

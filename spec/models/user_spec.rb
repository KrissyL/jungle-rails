require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(first_name: 'First', last_name: 'Name', email: 'email@email.com', password: 'password', password_confirmation: 'password')
  end

  it 'returns valid if all parameters exist' do
    expect(@user).to be_valid
  end

  it "should be invalid if password and password_confirmation don't match" do
    @user.password = 'passw'
    @user.password_confirmation = 'pword'

    expect(@user).to_not be_valid
  end

  it 'should be invalid if email is not unique' do
    user = User.create!(first_name: 'Existing', last_name: 'User', email: 'EMAIL@email.COM', password: 'pword', password_confirmation: 'pword')

    expect(@user).to_not be_valid
  end

  it 'should be invalid of password does not meet the minimum length of 5 characters' do
    @user.password = 'pass'
    @user.password_confirmation = 'pass'

    expect(@user).to_not be_valid
  end
end

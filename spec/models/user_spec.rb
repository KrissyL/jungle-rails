require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(first_name: 'First', last_name: 'Name', email: 'email@email.com', password: 'password', password_confirmation: 'password')
  end
  describe 'Validations' do
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

  describe '.authenticate_with_credentials' do
    it 'should login in user with successful credentials' do
      @user.save
      authentic = @user.authenticate_with_credentials(@user.email, @user.password)

      expect(authentic).to eql(@user)
    end

    it 'should not login in user with invalid credentials' do
      @user.save
      unsuccessful = @user.authenticate_with_credentials(@user.email, @user.password = 'somepassword')

      expect(unsuccessful).to eql(nil)
    end

    it 'should login in user without email case-sensitivity' do
      @user.save
      authenticate_email = @user.authenticate_with_credentials(@user.email = 'EMAIL@emaIL.Com', @user.password)

      expect(authenticate_email).to eql(@user)
    end

    it 'should authenticate user regardless of whitespace around email' do
      @user.save
      with_whitespace = @user.authenticate_with_credentials(@user.email = ' EMAIL@emaIL.Com ', @user.password)

      expect(with_whitespace).to eql(@user)
    end
  end

end

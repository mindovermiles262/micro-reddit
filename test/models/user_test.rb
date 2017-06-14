require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: 'Dr. Who', email: 'foo@bar.com')
  end

# Validate user name
  test 'user name present' do
    @user.name = '   '
    assert_not @user.valid?
  end
  test 'users name not too long' do
    @user.name = 'a' * 51
    assert_not @user.valid?
  end

# Validate user email address
  test 'email present' do
    @user.email = ' '
    assert_not @user.valid?
  end
  test 'email not too long' do
    @user.email = 'a' * 244 + '@example.com'
    assert_not @user.valid?
  end
  test 'email validation accepts valid address' do
    valid_emails = %w[user@example.com USER@foo.com A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_emails.each do |address|
      @user.email = address
      assert @user.valid?, "#{address.inspect} should be valid email"
    end
  end
  test 'email validation rejects invalid addresses' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |address|
      @user.email = address
      assert_not @user.valid?, "#{address.inspect} should be invalid address"
    end
  end

end

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @post = Post.new(title: 'Hello, World', body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at est convallis, consequat ligula quis, lacinia erat. Morbi rhoncus dolor ut nunc ullamcorper sollicitudin. Ut suscipit dictum libero nec tempus. Nullam vestibulum maximus felis vitae pulvinar. Donec interdum lacus felis, sit amet iaculis mauris faucibus nec. Aliquam in mauris ut justo gravida placerat. In tempor ornare mi, eu ultricies neque commodo')
  end

# Validate title
  test 'title is present' do
    @post.title = '   '
    assert_not @post.valid?
  end
  test 'title not too long' do
    @post.title = 'a' * 101
    assert_not @post.valid?
  end
  test 'title is not too short' do
    @post.title = 'ab'
    assert_not @post.valid?
  end

# Validate body
  test 'body is present' do
    @post.body = '  '
    assert_not @post.valid?
  end
    test 'body not too long' do
    @post.body = 'a' * 10001
    assert_not @post.valid?
  end
  test 'body is not too short' do
    @post.body = 'abcd12345'
    assert_not @post.valid?
  end

end

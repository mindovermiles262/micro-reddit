require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
    User.create(name: 'Dr. Who', email: 'foo@bar.com')
    Post.create(title: 'Hello, World', body: 'Lorem ipsum dolor sit')
    @comment = Comment.new(body: 'This is a comment', user_id: User.first.id, post_id: Post.first.id )
  end

  test 'body is present' do
    @comment.body = '  '
    assert_not @comment.valid?
  end

end

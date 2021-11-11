require 'rails_helper'

RSpec.describe Post, type: :model do
  current_user = User.first_or_create!(email: 'dean@example.com', password: 'password', password_confirmation: 'password')
  it 'has a title' do
    post = Post.new(
      title: '',
      body: 'A valid body',
      user: current_user,
      views: 0
    )
    expect(post).to_not be_valid

    post.title = 'A new valid title'
    expect(post).to be_valid
  end

  it 'has a body' do
    post = Post.new(
      title: 'A valid title',
      body: '',
      user: current_user,
      views: 0
    )
    expect(post).to_not be_valid

    post.body = 'A new valid body'
    expect(post).to be_valid

  end

  it 'has a title at least 2 chars long' do
    post = Post.new(
      title: '',
      body: 'A valid body',
      user: current_user,
      views: 0
    )
    expect(post).to_not be_valid

    post.title = '12'
    expect(post).to be_valid

  end

  it 'has a body 5 chars or more' do
    post = Post.new(
      title: 'Valid title',
      body: '',
      user: current_user,
      views: 0
    )
    expect(post).to_not be_valid

    post.body = 'fives'
    expect(post).to be_valid

  end

  it 'has a body of at most 100 chars' do
    hundred_chars_string = '1PhYXQyGLJ1pnK7f16zWnXDiEdNyvCf717fx0qK26Ha9KauczpvjLDGDhNHOeHXiSpCUmZcd8ErXRVSeFV3NQkpVdCfcskIUFmlk'
    post = Post.new(
      title: 'valid title',
      body: '',
      user: current_user,
      views: 0
    )
    expect(post).to_not be_valid

    post.body = hundred_chars_string
    expect(post).to be_valid

    post.body = hundred_chars_string + "1"
    expect(post).to_not be_valid

  end

  it 'has numerical views' do
    post = Post.new(
      title: 'valid title',
      body: '',
      user: current_user,
      views: 0
    )
    expect(post.views).to be_a(Integer)
  end
end

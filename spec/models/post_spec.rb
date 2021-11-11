require 'rails_helper'

RSpec.describe Post, type: :model do
  current_user = User.find_or_create!(email: 'dean@example.com', password: 'password', password_confirmation: 'password')
  it 'has a title' do

  end

  it 'has a body' do

  end

  it 'has a title at least 2 chars long' do

  end

  it 'has a body between 5 and 100 chars' do

  end

  it 'has numerical views' do

  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  current_user = User.first_or_create!(email: 'dean@example.com', password: 'password', password_confirmation: 'password')

  it 'has an id' do
    expect(current_user.id).to eq(1)
  end
end

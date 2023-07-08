require 'rails_helper'

describe User, type: :model do
  before :each do
    @user = User.create!(name: 'Winnie', email: 'winnie@example.com', password: '000000')
  end

  it 'User model field should be equal to test user' do
    expect(@user.name).to eq('Winnie')
    expect(@user.email).to eq('winnie@example.com')
    expect(@user.password).to eq('000000')
  end
end
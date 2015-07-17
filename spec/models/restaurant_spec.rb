require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  let(:an_owner) do
    Owner.create(
      name: 'Thing',
      email: 'a@a.com',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  it 'validates the presence of name' do
    restaurant = Restaurant.new(owner: an_owner)
    expect(restaurant.valid?).to be false
    expect(restaurant.errors.messages[:name]).to_not be nil
  end

  it 'has an owner' do
    restaurant = Restaurant.new(owner: an_owner)
    expect(restaurant.owner).to eq an_owner
  end
end

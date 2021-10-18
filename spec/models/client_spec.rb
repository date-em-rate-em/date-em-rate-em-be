require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'relationships' do
    it {should have_many(:reviews)}
    it {should have_many(:users).through(:reviews)}
  end
  describe 'validations' do
    describe 'custom validation' do
      it 'should have an email and/or phone number' do
        client = Client.new
        client.valid?

        expect(client.errors.messages.count).to eq(2)
      end
    end
  end
end

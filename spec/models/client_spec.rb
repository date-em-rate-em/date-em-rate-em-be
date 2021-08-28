require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'relationships' do
    it {should have_many(:reviews)}
    it {should have_many(:users).through(:reviews)}
  end
end

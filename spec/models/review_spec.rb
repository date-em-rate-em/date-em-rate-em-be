require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'relationships' do
    it {should belong_to(:user)}
    it {should belong_to(:client)}
  end

  describe 'validations' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:client) }
    it { should validate_presence_of(:rating) }
    it { should validate_presence_of(:safety_meter) }

    it do
      should validate_numericality_of(:rating).
      is_greater_than_or_equal_to(1).
        is_less_than_or_equal_to(5)
    end

    it do
      should validate_numericality_of(:safety_meter).
      is_greater_than_or_equal_to(1).
        is_less_than_or_equal_to(10)
    end

    it do
      should validate_numericality_of(:payment).
      is_greater_than_or_equal_to(1).
        is_less_than_or_equal_to(10)
    end

    it do
      should validate_numericality_of(:kindness).
      is_greater_than_or_equal_to(1).
        is_less_than_or_equal_to(10)
    end

    it do
      should validate_numericality_of(:vibe).
      is_greater_than_or_equal_to(1).
        is_less_than_or_equal_to(10)
    end

    it do
      should validate_numericality_of(:size).
      is_greater_than_or_equal_to(1).
        is_less_than_or_equal_to(18)
    end
    
  end
end

require 'rails_helper'

RSpec.describe PizzaType, type: :model do

  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of(:name).case_insensitive }
    it { should validate_length_of(:name).is_at_most(50) }
    it { should validate_presence_of :price }
    it { should validate_numericality_of(:price).is_less_than_or_equal_to(999_999.99)}
    it { should validate_numericality_of(:price).is_greater_than(0)}
  end

  let(:pizza_type) { build(:pizza_type) }

  context 'with valid params' do
    it 'creates pizza_type' do
      pizza_type.save

      expect(pizza_type).to be_valid
    end
  end

  let(:pizza_type_without_name) { build(:pizza_type_without_name) }

  context 'with invalid params' do
    it 'does not creates pizza_type' do
      pizza_type_without_name.save

      expect(pizza_type_without_name).to be_invalid
    end
  end

  let(:pizza_type_without_price) { build(:pizza_type_without_price) }

  context 'with invalid params' do
    it 'does not creates pizza_type' do
      pizza_type_without_price.save

      expect(pizza_type_without_price).to be_invalid
    end
  end
end

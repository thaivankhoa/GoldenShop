require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'association' do
    it { should have_many(:items).through(:item_categories).dependent(:destroy) }
    it { should have_many(:item_categories) }
  end

  describe 'validate' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_length_of(:name).is_at_least(3) }
    it { should validate_length_of(:name).is_at_most(25) }
  end
end

require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'association' do
    it { should have_many(:item_categories) }
    it { should have_many(:categories).through(:item_categories) }

    it { should belong_to(:user) }
  end

  describe 'validate' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:quantity_stock) }
    it { should validate_presence_of(:user_id) }
    it { should validate_length_of(:title).is_at_most(50) }
    it { should validate_length_of(:title).is_at_least(3) }
    it { should validate_length_of(:description).is_at_most(300) }
    it { should validate_length_of(:description).is_at_least(10) }
  end
end

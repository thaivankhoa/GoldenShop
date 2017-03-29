require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'association' do
    it { should have_many(:order_items).dependent(:destroy) }
    it { should belong_to(:user) }
  end
end

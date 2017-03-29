require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe 'association' do
    it { should have_many(:order_items) }
  end
end

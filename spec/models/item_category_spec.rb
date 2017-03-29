require 'rails_helper.rb'

RSpec.describe ItemCategory, type: :model do
  describe 'association' do
    it { should belong_to(:item) }
    it { should belong_to(:category)}
  end
end

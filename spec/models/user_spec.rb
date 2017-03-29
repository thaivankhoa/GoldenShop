
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'association' do
    it { should have_many(:items).dependent(:destroy) }
    it { should have_many(:orders) }
  end

  describe 'validate' do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username).case_insensitive }
    it { should validate_length_of(:username).is_at_least(3) }
    it { should validate_length_of(:username).is_at_most(50) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    # it { should validate_length_of(:email).is_at_least(10) }
    it { should validate_length_of(:email).is_at_most(100) }
    it { should have_secure_password }
  end
end

#  create_table "carts", force: :cascade do |t|
#    t.datetime "created_at", null: false
#    t.datetime "updated_at", null: false
#  end

require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe 'association' do
    it { should have_many(:order_items) }
  end
end

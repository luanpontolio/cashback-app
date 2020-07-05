require 'rails_spec'

# Test suite for the Todo model
RSpec.describe Offer, type: :model do
  let(:offer) { create(:offer) }

  describe '#offer ' do
    context 'validations' do
      it { should validate_presence_of(:advertiser_name) }
      it { should validate_presence_of(:url) }
      it { should validate_presence_of(:description) }
      it { should validate_presence_of(:start_at) }
    end
  end
end

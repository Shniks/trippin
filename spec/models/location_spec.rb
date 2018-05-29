equire 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'Validations' do
   it { should validate_presence_of(:latitude) }
   it { should validate_presence_of(:longitude) }
   it { should validate_presence_of(:address) }
 end

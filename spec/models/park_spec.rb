require 'rails_helper'

RSpec.describe Park, type: :model do
  describe 'Validations' do
    it{ is_expected.to validate_presence_of(:latitude) }
    it{ is_expected.to validate_presence_of(:longitude) }
    it{ is_expected.to validate_presence_of(:full_name) }
  end

  describe 'Class Methods' do
    describe '.create_parks' do
      it 'Creates a park object' do
        park = create!(:park)

        binding.pry
      end
    end
  end 

end

require 'rails_helper'

RSpec.describe Park, type: :model do
  it{ is_expected.to validate_presence_of(:latitude) }
  it{ is_expected.to validate_presence_of(:longitude) }
  it{ is_expected.to validate_presence_of(:full_name) }
end

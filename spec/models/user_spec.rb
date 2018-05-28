require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
   it { should validate_presence_of(:name) }
   it { should validate_presence_of(:uid) }
   it { should validate_presence_of(:screen_name) }
   it { should validate_presence_of(:oauth_token) }
 end
end

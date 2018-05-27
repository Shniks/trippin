require 'spec_helper'
require 'rake'

describe 'Import all rake task' do
  before :all do
    Rake.application.rake_require 'tasks/import'
    Rake::Task.define_task(:environment)
  end

  describe 'import:all' do
    it 'Should import park information' do
      park = create(:park)

      allow(Park).to receive(:create_parks).and_return(park)
    end
  end
end

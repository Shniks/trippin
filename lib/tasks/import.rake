namespace :import do
  desc 'Populate parks database with national parks data'
  task all: :environment do
    puts 'Calling the NPS API and loading information for all the National Parks.'
    load_parks
    puts 'All information loaded and stored in the database. Your app is ready to go!'
  end

  def load_parks
    Park.destroy_all
    parks = ParkSearch.new.raw_parks
    parks.each do |park|
      next if park[:latLong].empty?
      Park.create_parks(park)
    end
  end
end

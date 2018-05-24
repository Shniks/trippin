namespace :import do
  desc 'Populate parks database with national parks data'
  task all: :environment do
    puts 'Loading information on National Parks using the NPS API. Be right back!'
    load_parks
    puts 'All information loaded and stored in the database. Your app is ready to go!'
  end

  def load_parks
    end
  end
end

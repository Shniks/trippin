FactoryBot.define do
  factory :park do
    state { "Colorado" }
    description { "Rocky Mountain National Park is the best park in Colorado" }
    directions_info { "Go to Boulder and make a left to Estes Park" }
    directions_url { "http://awesomerockymountains.com/directions" }
    full_name { "Rocky Mountain National Park" }
    url { "http://awesomerockymountains.com" }
    weather_info { "Partly cloudy with a chance of shower" }
    latitude { "40.3428" }
    longitude { "-105.6836" }
  end
end

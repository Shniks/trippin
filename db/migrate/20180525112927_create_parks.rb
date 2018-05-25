class CreateParks < ActiveRecord::Migration[5.1]
  def change
    create_table :parks do |t|
      t.string :state
      t.string :description
      t.string :directions_info
      t.string :directions_url
      t.string :full_name
      t.string :url
      t.string :weather_info
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end

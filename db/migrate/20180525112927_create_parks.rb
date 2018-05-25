class CreateParks < ActiveRecord::Migration[5.1]
  def change
    create_table  :parks do |t|
      t.string    :state
      t.text      :description
      t.text      :directions_info
      t.string    :directions_url
      t.string    :full_name
      t.string    :url
      t.text      :weather_info
      t.string    :latitude
      t.string    :longitude

      t.timestamps
    end
  end
end
